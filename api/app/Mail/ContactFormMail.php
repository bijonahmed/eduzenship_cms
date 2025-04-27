<?php
// app/Mail/ContactFormMail.php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactFormMail extends Mailable
{
    use Queueable, SerializesModels;

    public $name;
    public $email;
    public $subject;
    public $messageContent;

    public function __construct($name, $email, $subject, $messageContent)
    {
        // Cast all inputs to strings
        $this->name = (string) $name;
        $this->email = (string) $email;
        $this->subject = (string) $subject;
        $this->messageContent = (string) $messageContent;
    }

    public function build()
    {
        return $this->subject($this->subject)
                    ->view('emails.contactMail') // You will create this view later
                    ->with([
                        'name' => $this->name,
                        'email' => $this->email,
                        'message' => $this->messageContent
                    ]);
    }
}
