<?php

namespace App\Http\Controllers\Dashboard;

use App\Category;
use App\Http\Controllers\Controller;
use App\Models\Attribute;
use App\Models\AttributeValues;
use App\Models\Booking;
use App\Models\Categorys;
use App\Models\MiningCategory;
use App\Models\MiningHistory;
use App\Models\Mystore;
use App\Models\Post;
use App\Models\PostCategory;
use App\Models\Product;
use App\Models\ProductAttributes;
use App\Models\ProductAttributeValue;
use App\Models\Room;
use App\Models\RoomImages;
use App\Models\Setting;
use App\Models\SubAttribute;
use App\Models\User;
use App\Rules\MatchOldPassword;
use Auth;
use BcMath\Number;
use Carbon\Carbon;
use DB;
use Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Validator;

class DashboardController extends Controller
{
    protected $userid;
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['countBookingData', 'getTodayBookingList']]);
    }


    public function countData(Request $request)
    {
        try {
            $checkToday       = date("Y-m-d");
            $postCategory     = PostCategory::where('post_category.status', 1)->count();
            $post             = Post::where('posts.status', 1)->count();
            $users            = User::where('status', 1)->count();
            // Prepare data
            $data = [
                'postCategory'   => $postCategory,
                'post'           => $post,
                'users'          => $users,
            ];

            return response()->json($data, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


    public function getTodayBookingList()
    {
        $checkToday  = date("Y-m-d");
        $bookingData = Booking::where('booking.booking_status', 1)
            ->select(
                'booking.*',
                'room.name as room_name',
                'booking.checkin',
                'booking.checkout',
                'room.roomPrice',
                'room.roomDescription',
                'bed_type.name as bed_name',
                \DB::raw('DATEDIFF(booking.checkout, booking.checkin) as total_booking_days')
            )
            ->whereDate('booking.created_at', $checkToday)
            ->leftJoin('room', 'booking.room_id', '=', 'room.id') // Fixing bed_type join
            ->leftJoin('bed_type', 'room.bed_type_id', '=', 'bed_type.id') // Fixing bed_type join
            ->get();

        return response()->json($bookingData, 200);
    }
}
