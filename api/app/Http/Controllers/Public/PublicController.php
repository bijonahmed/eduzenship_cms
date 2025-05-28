<?php

namespace App\Http\Controllers\Public;

use Cart;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Booking;
use App\Models\Post;
use App\Models\Room;
use App\Models\RoomImages;
use App\Models\SelectedRoomFacility;
use App\Models\Setting;
use App\Models\Sliders;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Validator;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\DB;
use App\Mail\ContactFormMail;

class PublicController extends Controller
{


    public function getSliders(Request $request)
    {
        try {
            $sliderImg = Sliders::where('status', 1)
                ->get()
                ->map(function ($slider) {
                    return [
                        'id'              => $slider->id,
                        'title_name'      => $slider->title_name,
                        'sliderImage'     => !empty($slider->sliderImage) ? url($slider->sliderImage) : ""
                    ];
                });

            return response()->json(['data' => $sliderImg], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


    public function getSliderData(Request $request)
    {
        //dd($request->all());
        $postData  = Post::where('post_category_id', 7)->where('status', 1)->get()->map(function ($data) {
            return [
                'id'       => $data->id,
                'title'    => $data->name,
                'image'    => !empty($data->thumnail_img) ? url($data->thumnail_img) : ""
            ];
        });;
        return response()->json([
            'data' => $postData
        ], 200);
    }



    public function getPostData(Request $request)
    {
        //dd($request->all());
        $post_category_id = !empty($request->post_category_id) ? $request->post_category_id : "";
        $postData  = Post::where('post_category_id', $post_category_id)->where('status', 1)->get()->map(function ($data) {
            return [
                'id'           => $data->id,
                'title'        => $data->name,
                'slug'         => $data->slug,
                'image'        => !empty($data->thumnail_img) ? url($data->thumnail_img) : "",
                'description'  => !empty($data->description) ? $data->description : ""
            ];
        });;
        return response()->json([
            'data' => $postData
        ], 200);
    }


    public function getMultipleCatData(Request $request)
    {
        //dd($request->all());
        $post_category_id = !empty($request->post_category_id) ? $request->post_category_id : "";
        $postData  = Post::whereIn('post_category_id', [2,3,4,6,8,14])->where('status', 1)->get()->map(function ($data) {
            return [
                'id'           => $data->id,
                'title'        => $data->name,
                'slug'         => $data->slug,
                'image'        => !empty($data->thumnail_img) ? url($data->thumnail_img) : "",
                'description'  => !empty($data->description) ? $data->description : ""
            ];
        });;
        return response()->json([
            'data' => $postData
        ], 200);
    }



    public function getFeaturesArticle(Request $request)
    {
        //dd($request->all());
        $post_category_id = !empty($request->post_category_id) ? $request->post_category_id : "";
        $post = Post::where('post_category_id', $post_category_id)
            ->where('status', 1)
            ->orderBy('id', 'desc') // Get the latest record
            ->first();

        $postData = optional($post)->toArray(); // Handle if no data found

        if (!empty($postData)) {
            $postData = [
                'id'           => $post->id,
                'title'        => $post->name,
                'slug'         => $post->slug,
                'image'        => !empty($post->thumnail_img) ? url($post->thumnail_img) : "",
                'description'  => !empty($post->description) ? $post->description : ""
            ];
        }
        return response()->json([
            'data' => $postData
        ], 200);
    }
    public function getSlugData(Request $request)
    {
        //dd($request->all());
        $postData  = Post::where('slug', $request->slug)->where('status', 1)->get()->map(function ($data) {
            return [
                'id'           => $data->id,
                'title'        => $data->name,
                'slug'         => $data->slug,
                'image'        => !empty($data->thumnail_img) ? url($data->thumnail_img) : "",
                'description'  => !empty($data->description) ? $data->description : ""
            ];
        });;
        return response()->json([
            'data' => $postData
        ], 200);
    }









    public function activeRooms(Request $request)
    {
        try {

            $rowsData = Room::where('room.status', 1)
                ->leftJoin('bed_type', 'room.bed_type_id', '=', 'bed_type.id') // Fixing bed_type join
                ->leftJoinSub(
                    \DB::table('room_images')
                        ->select('room_id', \DB::raw('MIN(id) as min_id')) // Get first image ID
                        ->groupBy('room_id'),
                    'first_images',
                    'room.id',
                    '=',
                    'first_images.room_id'
                )
                ->leftJoin('room_images', 'room_images.id', '=', 'first_images.min_id') // Join first image
                ->select('room.slug', 'room.id', 'room.name', 'room.roomDescription', 'bed_type.name as bed_name', 'roomPrice', 'room_images.roomImage')
                ->get()
                ->map(function ($room) {
                    return [
                        'room_id'         => $room->id,
                        'name'            => $room->name,
                        'slug'            => $room->slug,
                        'bed_name'        => $room->bed_name,
                        'roomPrice'       => number_format($room->roomPrice, 2),
                        'roomDescription' =>  Str::limit($room->roomDescription, 50), // Limit to 50 characters,
                        'roomImage'       => !empty($room->roomImage) ? url($room->roomImage) : ""
                    ];
                });
            return response()->json($rowsData, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }



    public function getRoomDetails(Request $request)
    {

        try {

            $roomParticular = Room::where('room.status', 1)->where('room.slug', $request->slug)
                ->select('room.*', 'bed_type.name as bed_name')
                ->leftJoin('bed_type', 'room.bed_type_id', '=', 'bed_type.id') // Fixing bed_type join
                ->first();

            $room_id          = $roomParticular->id;
            $activeRoomImg    = RoomImages::where('status', 1)
                ->where('room_id', $room_id)
                ->get()
                ->map(function ($room) {
                    // Check if roomImage exists and is not empty
                    return [
                        'roomImage' => !empty($room->roomImage) ? url($room->roomImage) : null // Returning null if empty
                    ];
                });

            $data['roomParticular'] = $roomParticular;
            $data['activeRoomImg']  = $activeRoomImg;

            return response()->json($data, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function checkselectedfacilities(Request $request)
    {

        try {
            $data = SelectedRoomFacility::where('room_id', $request->id)
                ->select('select_room_facilities.id', 'facility_group.name as facility_group_name', 'room.roomType as room_name', 'room_facility.name as facilities_name')
                ->leftJoin('facility_group', 'facility_group.id', '=', 'select_room_facilities.room_facility_group_id')
                ->leftJoin('room', 'room.id', '=', 'select_room_facilities.room_id')
                ->leftJoin('room_facility', 'room_facility.id', '=', 'select_room_facilities.facilities_id')
                ->orderby('id', 'desc')
                ->get();
            if ($data->isEmpty()) {
                return response()->json(['message' => 'No room sizes found'], 404);
            }
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function getGlobalData()
    {

        try {
            $data = Setting::where('id', 1)->first();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function sendContactForm(Request $request)
    {
        // Validate the incoming request data
        $validator = Validator::make($request->all(), [
            'name'    => 'required',
            'email'   => 'required|email',
            'subject' => 'required',
            'message' => 'required',
        ]);

        // If validation fails, return an error response
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Get the validated data
        $validatedData = $validator->validated();

        // Email content
        $to = "info@eduzenship.com"; // Email to send the message to
        $subject = $validatedData['subject']; // Email subject
        $message = "Message from: " . $validatedData['name'] . "\n";
        $message .= "Email: " . $validatedData['email'] . "\n\n";
        $message .= "Message:\n" . $validatedData['message']; // The actual message content

        // Headers
        $headers = "From: " . $validatedData['email'] . "\r\n";
        $headers .= "Reply-To: " . $validatedData['email'] . "\r\n";
        $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

        // Send the email
        if (mail($to, $subject, $message, $headers)) {
            return response()->json(['success' => 'Email sent successfully'], 200);
        } else {
            return response()->json(['error' => 'Failed to send email'], 500);
        }


        return response()->json(['message' => 'Message sent successfully'], 200);
    }
}
