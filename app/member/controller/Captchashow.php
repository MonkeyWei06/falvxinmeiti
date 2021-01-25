<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 18:41
 */
namespace app\member\controller;
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