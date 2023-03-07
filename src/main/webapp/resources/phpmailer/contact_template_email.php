<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea">
    <meta name="author" content="Ansonika">
    <title>Panagea</title>
</head>

<body>
<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'src/Exception.php';
require 'src/PHPMailer.php';

$mail = new PHPMailer(true);

try {

    //Recipients - main edits
    $mail->setFrom('info@panagea.com', 'Message from Panagea');                     // Email Address and Name FROM
    $mail->addAddress('info@panagea.com', 'Jhon Doe');                              // Email Address and Name TO - Name is optional
    $mail->addReplyTo('noreply@pangea.com', 'Message from Panagea');                // Email Address and Name NOREPLY
    $mail->isHTML(true);                                                       
    $mail->Subject = 'Message from Panagea';                                      // Email Subject    

    // Email verification, do not edit
    function isEmail($email_contact ) {
        return(preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/",$email_contact));
    }
   
    // Form fields
    $name_contact     = $_POST['name_contact'];
    $lastname_contact    = $_POST['lastname_contact'];
    $email_contact    = $_POST['email_contact'];
    $phone_contact   = $_POST['phone_contact'];
    $message_contact = $_POST['message_contact'];
    $verify_contact   = $_POST['verify_contact'];

    if(trim($name_contact) == '') {
    echo '<div class="error_message">You must enter your Name.</div>';
    exit();
    } else if(trim($lastname_contact ) == '') {
        echo '<div class="error_message">You must enter your Last name.</div>';
        exit();
    } else if(trim($email_contact) == '') {
        echo '<div class="error_message">Please enter a valid email address.</div>';
        exit();
    } else if(!isEmail($email_contact)) {
        echo '<div class="error_message">You have enter an invalid e-mail address, try again.</div>';
        exit();
        } else if(trim($phone_contact) == '') {
        echo '<div class="error_message">Please enter a valid phone number.</div>';
        exit();
    } else if(!is_numeric($phone_contact)) {
        echo '<div class="error_message">Phone number can only contain numbers.</div>';
        exit();
    } else if(trim($message_contact) == '') {
        echo '<div class="error_message">Please enter your message.</div>';
        exit();
    } else if(!isset($verify_contact) || trim($verify_contact) == '') {
        echo '<div class="error_message"> Please enter the verification number.</div>';
        exit();
    } else if(trim($verify_contact) != '4') {
        echo '<div class="error_message">The verification number you entered is incorrect.</div>';
        exit();
    }                          
            
    // Get the email's html content
    $email_html = file_get_contents('template-email.html');

    // Setup html content
    $e_content = "You have been contacted by <strong>$name_contact</strong> with the following message:<br><br>$message_contact<br><br>You can contact $name_contact via email at $email_contact or phone $phone_contact.";
    $body = str_replace(array('message'),array($e_content),$email_html);
    $mail->MsgHTML($body);
    $mail->CharSet = 'UTF-8';
    $mail->send();

    // Confirmation/autoreplay email send to who fill the form
    $mail->ClearAddresses();
    $mail->addAddress($_POST['email_contact']); // Email address entered on form
    $mail->isHTML(true);
    $mail->Subject    = 'Confirmation'; // Custom subject
    
    // Get the email's html content
    $email_html_confirm = file_get_contents('confirmation.html');

    // Setup html content, do not edit
    $body = str_replace(array('message'),array($e_content),$email_html_confirm);
    $mail->MsgHTML($body);
    $mail->CharSet = 'UTF-8';
    $mail->Send();

    // Succes message
    echo '<div id="success_page" style="padding:25px 0"><strong >Email Sent.</strong><br>Thank you, your message has been submitted. We will contact you shortly.</div>';
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }  
?> 

</body>
</html>