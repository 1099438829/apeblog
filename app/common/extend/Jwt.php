<?php


namespace app\common\extend;

use Firebase\JWT\JWT as jt;

/**
 * Class Jwt
 * @package app\common\utils
 */
class Jwt
{
    /**
     * 生成 toekn
     * @param array $param
     * @return string
     */
    public static function signToken(array $param): string
    {
        $salt = '!@$@#%^%&^%*' . app()->request->ip() . app()->request->domain();
        $token = array(
            "iss" => $salt,
            "aud" => $salt,
            "iat" => time(),
            "nbf" => time(),
            "exp" => time() + 60 * 60 * 24,
            "data" => $param
        );
        return "Bearer " . jt::encode($token, $salt, "HS256");
    }

    /**
     * 解析token
     * @param string $token
     * @return array
     */
    public static function checkToken(string $token)
    {
        $salt = '!@$@#%^%&^%*' . app()->request->ip() . app()->request->domain();
        try {
            $data = jt::decode(trim(ltrim($token, 'Bearer')), $salt, ["HS256"]);
            $data = (array)$data;
            return (array)$data['data'];
        } catch (\Firebase\JWT\SignatureInvalidException $e) {
            $status['msg'] = "签名不正确";
            return $status;
        } catch (\Firebase\JWT\BeforeValidException $e) {
            $status['msg'] = "token失效";
            return $status;
        } catch (\Firebase\JWT\ExpiredException $e) {
            $status['msg'] = "token失效";
            return $status;
        } catch (\Exception $e) {
            $status['msg'] = "未知错误";
            return $status;
        }
    }
}