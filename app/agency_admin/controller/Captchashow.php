<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/30
 * Time: 11:06
 */
namespace app\agency_admin\controller;
use think\captcha as ThinkCaptcha;
class Captchashow
{
    public function VerificationCode($id='')
    {
        $Config=config('captcha');
        $captcha = new ThinkCaptcha\Captcha($Config);
        return $captcha->entry($id);
    }
}