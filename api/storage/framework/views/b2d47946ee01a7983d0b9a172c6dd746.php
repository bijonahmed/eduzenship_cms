<!-- resources/views/emails/contactForm.blade.php -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form Submission</title>
</head>
<body>
    <h3>You have a new contact form submission Eduzenship</h3>
    <p><strong>Name:</strong> <?php echo e($name); ?></p>
    <p><strong>Email:</strong> <?php echo e($email); ?></p>
    <p><strong>Subject:</strong> <?php echo e($subject); ?></p>
    <p><strong>Message:</strong> <?php echo nl2br(e($message)); ?></p>
</body>
</html>
<?php /**PATH D:\Server\htdocs\eduzenship\api\resources\views/emails/contactMail.blade.php ENDPATH**/ ?>