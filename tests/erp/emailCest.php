<?php

use \SuperUser;
use \Codeception\Util\Locator;

class emailCest{
    public function _before(SuperUser $I){
    }

    public function _after(SuperUser $I){
    }
    
    public function test_check_email_settings(SuperUser $i){
    	$i->login('management@xavoc.com');
        $i->click('Company / CEO');
        $i->wait(2);
        $i->click('General Settings');
        $i->waitForText('No matching records found');
    }

    public function test_add_email_settings(SuperUser $i){
    	$i->login('management@xavoc.com');
        $i->click('Company / CEO');
        $i->wait(2);
        $i->click('General Settings');
        $i->waitForText('Emails Setting');
        $i->click('Add Communication EmailSetting');
        $i->fillAtkField('name','Management');
        $i->checkOption('form input[data-shortname="is_support_email"]');
        $i->select2Option("encryption",['text'=>'ssl']);
        $i->fillAtkField('email_host','sun.rightdns.com');
        $i->fillAtkField('email_port','465');
        $i->fillAtkField('email_username','management@xavoc.com');
        $i->fillAtkField('email_password','Management@xavoc');
        $i->click('Next');
       
        $i->fillAtkField('from_email','management@xavoc.com');
        $i->fillAtkField('from_name','Xavoc Management');
        $i->fillAtkField('sender_email','management@xavoc.com');
        $i->fillAtkField('sender_name','Xavoc Management');
        $i->fillAtkField('email_reply_to','management@xavoc.com');
        $i->fillAtkField('email_reply_to_name','Xavoc Management');
        $i->click('Next');

        $i->fillAtkField('imap_email_host','sun.rightdns.com');
        $i->fillAtkField('imap_email_port','993');
        // $i->checkOption('form input[data-shortname="is_imap_enabled"]');
        $i->fillAtkField('imap_email_username','management@xavoc.com');
        $i->fillAtkField('imap_email_password','Management@xavoc');
       	$i->click('Next');
        
        $i->fillAtkField('smtp_auto_reconnect','100');
        $i->fillAtkField('email_threshold','1');
        $i->fillAtkField('emails_in_BCC','50');
        $i->click('Next');
        $i->fillAtkField('bounce_imap_email_host','sun.rightdns.com');
        $i->fillAtkField('bounce_imap_email_port','993');
        $i->fillAtkField('return_path','bounce@xavoc.com');
        $i->fillAtkField('bounce_imap_email_password','Bounce@123');
        $i->click('Next');
        $i->click('Save');

    }

    public function test_check_email_setting(SuperUser $i){
    	$i->login('management@xavoc.com');
        $i->click('Company / CEO');
        $i->wait(2);
        $i->click('General Settings');
        $i->waitForText('management@xavoc.com');
    }

    public function text_check_email_setting_correct(SuperUser $i){
    	$i->login('management@xavoc.com');
    	$i->click('Emails');
    	$i->waitForText('Inbox',5);
    	$i->click(['css'=>'.email-nav-nano-content a.email-compose-btn']);
    	$i->waitForText('Compose Email',5);
        $i->select2Option("email_username",['text'=>'Management']);
        $i->select2Option('email_to','Super User <vijay.mali552@gmail.com>');
        $i->click('Cc');
        $i->click('Bcc');
        $i->fillAtkField('email_subject','Test case Email Testing Subject');
        $i->fillAtkField('email_body','Test case Email Testing Message Body');
        $i->click('Send');
        $i->wait(10);
    }
}    