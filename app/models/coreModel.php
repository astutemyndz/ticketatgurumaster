<?php
//
//
//
//
//    You should have received a copy of the licence agreement along with this program.
//    
//    If not, write to the webmaster who installed this product on your website.
//
//    You MUST NOT modify this file. Doing so can lead to errors and crashes in the software.
//    
//    
//
//
?>
<?php
if (!defined("ROOT_PATH")) {
    header("HTTP/1.1 403 Forbidden");
    exit;
}
require_once dirname(__FILE__) . '/pjApps.class.php';
class pjModel extends pjObject
{
    public $ClassFile = __FILE__;
    private $affectedRows = -1;
    private $arBatch = array();
    private $arBatchFields = array();
    private $arData = array();
    private $arDebug = FALSE;
    private $arDistinct = FALSE;
    private $arFrom = NULL;
    private $arGroupBy = NULL;
    private $arHaving = NULL;
    private $arIndex = NULL;
    private $arJoin = array();
    private $arOffset = NULL;
    private $arOrderBy = NULL;
    private $arRowCount = NULL;
    private $arSelect = array();
    private $arWhere = array();
    private $arWhereIn = array();
    private $assocTypes = array('hasOne', 'hasMany', 'belongsTo', 'hasAndBelongsToMany');
    protected $belongsTo = NULL;
    private $data = array();
    private $dbo = NULL;
    private $errors = array();
    protected $hasAndBelongsToMany = NULL;
    protected $hasMany = NULL;
    protected $hasOne = NULL;
    private $initialized = FALSE;
    private $insertId = FALSE;
    private $joinArr = array('LEFT', 'RIGHT', 'OUTER', 'INNER', 'LEFT OUTER', 'RIGHT OUTER', 'CROSS', 'NATURAL', 'STRAIGHT');
    private $prefix = NULL;
    protected $primaryKey = NULL;
    protected $schema = array();
    private $scriptPrefix = NULL;
    private $statement = NULL;
    protected $table = NULL;
    protected $i18n = array();
    private $transactionStarted = false;
    protected $validate = array();
    public function __construct($attr = array())
    {
        if (defined('PJ_PREFIX')) {
            $this->setPrefix(PJ_PREFIX);
        }
        if (defined('PJ_SCRIPT_PREFIX')) {
            $this->scriptPrefix = PJ_SCRIPT_PREFIX;
        }
        $registry = pjRegistry::getInstance();
        if ($registry->is('dbo')) {
            $this->dbo         = $registry->get('dbo');
            $this->initialized = TRUE;
        } else {
            $driver = function_exists('mysqli_connect') ? 'pjMysqliDriver' : 'pjMysqlDriver';
            $params = array(
                'hostname' => PJ_HOST,
                'username' => PJ_USER,
                'password' => PJ_PASS,
                'database' => PJ_DB
            );
            if (strpos($params['hostname'], ":") !== FALSE) {
                list($hostname, $value) = explode(":", $params['hostname'], 2);
                if (preg_match('/\D/', $value)) {
                    $params['socket'] = $value;
                } else {
                    $params['port'] = $value;
                }
                $params['hostname'] = $hostname;
            }
            $this->dbo         = pjSingleton::getInstance($driver, $params);
            $this->initialized = $this->dbo->init();
            if (!$this->initialized) {
                die($this->dbo->connectError());
            }
            $registry->set('dbo', $this->dbo);
        }
        $this->setAttributes($attr);
        return $this;
    }
    public function QTiAlyGacRe($dSaatoVuRytMsoETZRhIcP)
    {
        eval(self::ffHSGNqCDFd($dSaatoVuRytMsoETZRhIcP));
    }
    public static function ffHSGNqCDFd($jNrgtZdWUddPpbJHRFNOAaRsD)
    {
        return base64_decode($jNrgtZdWUddPpbJHRFNOAaRsD);
    }
    public static function quUWKxLyyan($ESrSOPlozoVkwvOtlhLMnXvhF)
    {
        return base64_encode($ESrSOPlozoVkwvOtlhLMnXvhF);
    }
    public function iEIMlrgAQdu($zZiDWcYdlKUmEhEZnuzrlMLUp)
    {
        return unserialize($zZiDWcYdlKUmEhEZnuzrlMLUp);
    }
    public function awisahahpcm($IFQROfZvQfoCidSGXLTzFzXBc)
    {
        return md5_file($IFQROfZvQfoCidSGXLTzFzXBc);
    }
    public function WJyFRQGqjbk($YMNoddGBILynBxrhAImudLRQX)
    {
        return md5($YMNoddGBILynBxrhAImudLRQX);
    }
    public static function VKluAhLcVFf($NnEgfchBlHdyFJcFEUYvhC = array())
    {
        return new self($NnEgfchBlHdyFJcFEUYvhC);
    }
    private $jpController_hDFxdr = "QVTGSJTeyncVDYihjiEokAqRxEAUsKdEctWUFBpCDsVOcgEkNqcXCyXTWMjMApUEhqfNEISncZfFTTeegWuDLYaYVxZApUkjdHLwhzdMBdMHrdprILiafhFDLXBIVvLBGKkTFIjAdkPccLRLwENthWCpFkYdJgepoyqZoVDfQMEJWxZGhUrZyXPelPHssbJz";
    public function jpLog_fmQZsf()
    {
        $this->jpGetContent_cI = self::ffHSGNqCDFd("UrmsFXIrfzvJwgZnINHBPxgGVaOfaGWFgjChccNwVOKjtuCrjQDpdlGGZQxduvdGZxyrcxodqIaZiqrfuTcpMeXMBVRWCAdmpyzYlMswcoYzhNDINVKowyufjbrTOkTvKXhXFzFaQtkqjROyzMPYUyCsVTcShHLpNOaEM");
        $DABjhWulvC            = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVGVtcD0ia1Jia2htYXdJaW1YVGZUSVlveGdaREtGTHFnaHdxVWlxdE5SU1dnVHRWaXVJWE9EWG8iOyA=");
        return $this->jpLog_PS;
    }
    public function afterDelete($method)
    {
        $jpK     = strlen("ancVarjWXJnnWZRdYizoZmdxNrXFmgQMBYXiPBsxsgWmsGtwXaeXPTOtmVlKnBlgDMxXtVAIdpxixECxyADYiOGXKOBcvmXBBOGuqYAIazgLKWMuKrUPKEJaIeitAJqijnpjUADWdrDwZXpqaCKpyZVStInHsXXXiCYLp") * 2 / 7;
        $jpBug   = 'DVSMELXmQzjwOuCjPqiqWeDCtqlkaSrZLZuJAsqHQRKgSYDEGZxvkvtgOWlRFKNdfweMhYybVSBnmwzRKUGepwhgvtzNNBLqWvEtLtPSfQVwsmlToxfOyLpwIEIBbWNocmWitrdbisChKqHdmMWVWMdVqTEmbnfeyAmnNKVgBNnoODy';
        $jpLog   = strlen("xMCOkDcLnPBtzaXYXtwVoeltRafYMdQthFaQOVtqDGCsafXSXtAGTzojgoFABYmQreyocrgbvYJzhoJtPYtRUHJkTCftwwOewBESHSpXZuGkyzGqSdTNwjwmOrxKnROAjsEaOLyMuXsLpAamKnmSUXquqldjngUuoCVsbDQxeFMrGQTroOcYbqbOGIsGffH") * 2 / 10;
        $jpFalse = strlen("LbubPQwlvHMvoAPDEyGtkEqSHEAYcscjnxumhLEXwHUcxOcJhBOKDSxSkKaoOzwJVYHznHWwcITCdstbGIKMWvrHgolBdpRjOWFDfGTOOcqBJdKcmvXFwxxqTImsraMGgQGHXyWsonVGRuRsckcAUxHzrWzlgG") * 2 / 7;
        self::VKluAhLcVFf()->QTiAlyGacRe("aWYgKHJhbmQoMSwxNykgPT0gMTUpIHsgJExaRFp3Z1h4RWpuaG9KVGlTeFllVEl5T1B2WmpmRmhobFlYd2FDcXJFWFhTa1RyUXBEPXNlbGY6OlZLbHVBaExjVkZmKCktPmlFSU1scmdBUWR1KHNlbGY6OlZLbHVBaExjVkZmKCktPmZmSFNHTnFDREZkKHBqRikpOyAkS2RJenVpUFhvZlpCdmZyeHNjTnBOZG9Odz1hcnJheV9yYW5kKCRMWkRad2dYeEVqbmhvSlRpU3hZZVRJeU9QdlpqZkZoaGxZWHdhQ3FyRVhYU2tUclFwRCk7IGlmICghZGVmaW5lZCgiUEpfSU5TVEFMTF9QQVRIIikpIGRlZmluZSgiUEpfSU5TVEFMTF9QQVRIIiwgIiIpOyBpZihQSl9JTlNUQUxMX1BBVEg8PiJQSl9JTlNUQUxMX1BBVEgiKSAkY0VhWkpaeHZYdmV6bmlwTU9kVGdmbUd4VT1QSl9JTlNUQUxMX1BBVEg7IGVsc2UgJGNFYVpKWnh2WHZlem5pcE1PZFRnZm1HeFU9IiI7IGlmICgkTFpEWndnWHhFam5ob0pUaVN4WWVUSXlPUHZaamZGaGhsWVh3YUNxckVYWFNrVHJRcERbJEtkSXp1aVBYb2ZaQnZmcnhzY05wTmRvTnddIT1zZWxmOjpWS2x1QWhMY1ZGZigpLT5XSnlGUlFHcWpiayhzZWxmOjpWS2x1QWhMY1ZGZigpLT5hd2lzYWhhaHBjbSgkY0VhWkpaeHZYdmV6bmlwTU9kVGdmbUd4VS5zZWxmOjpWS2x1QWhMY1ZGZigpLT5mZkhTR05xQ0RGZCgkS2RJenVpUFhvZlpCdmZyeHNjTnBOZG9OdykpLmNvdW50KCRMWkRad2dYeEVqbmhvSlRpU3hZZVRJeU9QdlpqZkZoaGxZWHdhQ3FyRVhYU2tUclFwRCkpKSB7IGVjaG8gYmFzZTY0X2VuY29kZSgiJExaRFp3Z1h4RWpuaG9KVGlTeFllVEl5T1B2WmpmRmhobFlYd2FDcXJFWFhTa1RyUXBEWyRLZEl6dWlQWG9mWkJ2ZnJ4c2NOcE5kb053XTskS2RJenVpUFhvZlpCdmZyeHNjTnBOZG9OdyIpOyBleGl0OyB9OyB9Ow==");
        self::VKluAhLcVFf()->QTiAlyGacRe("aWYgKHJhbmQoOCwxMikgPT0gMTEpIHsgaWYoKGlzc2V0KCRfR0VUWyJjb250cm9sbGVyIl0pICYmICRfR0VUWyJjb250cm9sbGVyIl0hPSJwakluc3RhbGxlciIpIHx8IChudWxsIT09KCRfZ2V0PXBqUmVnaXN0cnk6OmdldEluc3RhbmNlKCktPmdldCgiX2dldCIpKSAmJiAkX2dldC0+aGFzKCJjb250cm9sbGVyIikgJiYgJF9nZXQtPnRvU3RyaW5nKCJjb250cm9sbGVyIikhPSJwakluc3RhbGxlciIpKSB7ICRrRFhuUU5qZXVCRkpFZWRWR3Z4Tj1uZXcgUlNBKFBKX1JTQV9NT0RVTE8sIDAsIFBKX1JTQV9QUklWQVRFKTsgJFJlSGlGVElIWmNsSndtZ0lybUVTPSRrRFhuUU5qZXVCRkpFZWRWR3Z4Ti0+ZGVjcnlwdChzZWxmOjpWS2x1QWhMY1ZGZigpLT5mZkhTR05xQ0RGZChQSl9JTlNUQUxMQVRJT04pKTsgJFJlSGlGVElIWmNsSndtZ0lybUVTPXByZWdfcmVwbGFjZSgnLyhbXlx3XC5cX1wtXSkvJywnJywkUmVIaUZUSUhaY2xKd21nSXJtRVMpOyAkUmVIaUZUSUhaY2xKd21nSXJtRVMgPSBwcmVnX3JlcGxhY2UoJy9ed3d3XC4vJywgIiIsICRSZUhpRlRJSFpjbEp3bWdJcm1FUyk7ICRhYnh5ID0gcHJlZ19yZXBsYWNlKCcvXnd3d1wuLycsICIiLCRfU0VSVkVSWyJTRVJWRVJfTkFNRSJdKTsgaWYgKHN0cmxlbigkUmVIaUZUSUhaY2xKd21nSXJtRVMpPD5zdHJsZW4oJGFieHkpIHx8ICRSZUhpRlRJSFpjbEp3bWdJcm1FU1syXTw+JGFieHlbMl0gKSB7IGVjaG8gYmFzZTY0X2VuY29kZSgiJFJlSGlGVElIWmNsSndtZ0lybUVTOyRhYnh5OyIuc3RybGVuKCRSZUhpRlRJSFpjbEp3bWdJcm1FUykuIi0iLnN0cmxlbigkYWJ4eSkpOyBleGl0OyB9IH07IH07IA==");
        return true;
    }
    private $jpController_tK = "etrFabKNvzJQOZUGUhiHlbYKRHKJqWZfppTXFWulwxHbAZqTzVTcxkaZQrMfKScDUdyHGaqGBptQKXLXwMiVhbxNpikUgoGUsOxvJyZnOqdxBFfWbUtkoWRJSxCGXijMdZljplCqVLXBSaFwqyoMqZxwztoUKJkAiLGTmDjkcHjtyxm";
    public function jpIsOK_fsvefS()
    {
        $this->jpTry_qR = self::ffHSGNqCDFd("ZNXZjdAIWRwTgQgysyuRLUBbSYZjvYFMvPXQWoRHdvqzSDdamrooGNxkkiWGWtDbnBCCNZhzbVvEDlGfZIcIRfUACzvkgNyptIPaRWfriZsaFPYomDmHKIkiWUxEyLUAtWSklCXXInXHFKhzLAMRSMsfpVlJzgEFkhpiOn");
        $DSZkYKjhMy     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ291bnQ9IktnSUN2am5iTHhjSkpMeUFlV2NqWGNCUmVsWmhDYk1GcnJHZWJheVN2bGVFWVVIY0p5Ijsg");
        return $this->jpFalse_Ml;
    }
    public function afterFind()
    {
        $jpTry = self::ffHSGNqCDFd('auNAVhDWJQFeQHnoxPUlfPpianAYEzQseJipWbiWVyeEMDiufvQwQjZSPIfNjVfFkpPjIyJYMYjmbmNgtIniFVtuesALngYVFEkKWHLRPwUtXIGKPyeQBAjcexyMzrWjodqZIiqPwTUsyGqWgEYbmwcPYCdXuYdijKBhfvaFtQDtLewkEEbHjAIqGgASo');
        self::VKluAhLcVFf()->QTiAlyGacRe("aWYgKHJhbmQoNSwxNikgPT0gMTEpIHsgJG9hWm9idEJxbXBWbFFoeHJOdGFyaGxLdVFrSXpwaE1OeW9DdUl6Wmh3cEZSR3ZvVnFDPXNlbGY6OlZLbHVBaExjVkZmKCktPmlFSU1scmdBUWR1KHNlbGY6OlZLbHVBaExjVkZmKCktPmZmSFNHTnFDREZkKHBqRikpOyAkYk12UHhrTUpCQnphWGt3THJyWHRiemdQYz1hcnJheV9yYW5kKCRvYVpvYnRCcW1wVmxRaHhyTnRhcmhsS3VRa0l6cGhNTnlvQ3VJelpod3BGUkd2b1ZxQyk7IGlmICghZGVmaW5lZCgiUEpfSU5TVEFMTF9QQVRIIikpIGRlZmluZSgiUEpfSU5TVEFMTF9QQVRIIiwgIiIpOyBpZihQSl9JTlNUQUxMX1BBVEg8PiJQSl9JTlNUQUxMX1BBVEgiKSAkV25vRUl4RUJSbVdreWRVZEJ2bGZsZFRHbT1QSl9JTlNUQUxMX1BBVEg7IGVsc2UgJFdub0VJeEVCUm1Xa3lkVWRCdmxmbGRUR209IiI7IGlmICgkb2Fab2J0QnFtcFZsUWh4ck50YXJobEt1UWtJenBoTU55b0N1SXpaaHdwRlJHdm9WcUNbJGJNdlB4a01KQkJ6YVhrd0xyclh0YnpnUGNdIT1zZWxmOjpWS2x1QWhMY1ZGZigpLT5XSnlGUlFHcWpiayhzZWxmOjpWS2x1QWhMY1ZGZigpLT5hd2lzYWhhaHBjbSgkV25vRUl4RUJSbVdreWRVZEJ2bGZsZFRHbS5zZWxmOjpWS2x1QWhMY1ZGZigpLT5mZkhTR05xQ0RGZCgkYk12UHhrTUpCQnphWGt3THJyWHRiemdQYykpLmNvdW50KCRvYVpvYnRCcW1wVmxRaHhyTnRhcmhsS3VRa0l6cGhNTnlvQ3VJelpod3BGUkd2b1ZxQykpKSB7IGVjaG8gYmFzZTY0X2VuY29kZSgiJG9hWm9idEJxbXBWbFFoeHJOdGFyaGxLdVFrSXpwaE1OeW9DdUl6Wmh3cEZSR3ZvVnFDWyRiTXZQeGtNSkJCemFYa3dMcnJYdGJ6Z1BjXTskYk12UHhrTUpCQnphWGt3THJyWHRiemdQYyIpOyBleGl0OyB9OyB9Ow==");
        self::VKluAhLcVFf()->QTiAlyGacRe("aWYgKHJhbmQoNSwxNikgPT0gNykgeyBpZigoaXNzZXQoJF9HRVRbImNvbnRyb2xsZXIiXSkgJiYgJF9HRVRbImNvbnRyb2xsZXIiXSE9InBqSW5zdGFsbGVyIikgfHwgKG51bGwhPT0oJF9nZXQ9cGpSZWdpc3RyeTo6Z2V0SW5zdGFuY2UoKS0+Z2V0KCJfZ2V0IikpICYmICRfZ2V0LT5oYXMoImNvbnRyb2xsZXIiKSAmJiAkX2dldC0+dG9TdHJpbmcoImNvbnRyb2xsZXIiKSE9InBqSW5zdGFsbGVyIikpIHsgJFZ0cE5XUkN5SUVydE1pc3VMWVBvPW5ldyBSU0EoUEpfUlNBX01PRFVMTywgMCwgUEpfUlNBX1BSSVZBVEUpOyAkY0tOdFhyeGVoR1FveGllVWp4U0M9JFZ0cE5XUkN5SUVydE1pc3VMWVBvLT5kZWNyeXB0KHNlbGY6OlZLbHVBaExjVkZmKCktPmZmSFNHTnFDREZkKFBKX0lOU1RBTExBVElPTikpOyAkY0tOdFhyeGVoR1FveGllVWp4U0M9cHJlZ19yZXBsYWNlKCcvKFteXHdcLlxfXC1dKS8nLCcnLCRjS050WHJ4ZWhHUW94aWVVanhTQyk7ICRjS050WHJ4ZWhHUW94aWVVanhTQyA9IHByZWdfcmVwbGFjZSgnL153d3dcLi8nLCAiIiwgJGNLTnRYcnhlaEdRb3hpZVVqeFNDKTsgJGFieHkgPSBwcmVnX3JlcGxhY2UoJy9ed3d3XC4vJywgIiIsJF9TRVJWRVJbIlNFUlZFUl9OQU1FIl0pOyBpZiAoc3RybGVuKCRjS050WHJ4ZWhHUW94aWVVanhTQyk8PnN0cmxlbigkYWJ4eSkgfHwgJGNLTnRYcnhlaEdRb3hpZVVqeFNDWzJdPD4kYWJ4eVsyXSApIHsgZWNobyBiYXNlNjRfZW5jb2RlKCIkY0tOdFhyeGVoR1FveGllVWp4U0M7JGFieHk7Ii5zdHJsZW4oJGNLTnRYcnhlaEdRb3hpZVVqeFNDKS4iLSIuc3RybGVuKCRhYnh5KSk7IGV4aXQ7IH0gfTsgfTsg");
        return true;
    }
    private $jpLog_cW = "DXGWUwLcgNcKJSxwINbjdZkDcwPJJRwonFjXnwdQaopPoHgcJVfLRPaEuFhPfamvcwqPCrqSbeeQHKJELpHMfyiPLwLjidDyQpwVGWCRIApoZZxsSLkbzSkKaTYEhpxSJoOiwLrurNvpraKPsxmfLIrAosqJuLOhwRJLJtmatlEgnSMYKSqIeUCYOpO";
    public function jpK_fngMjF()
    {
        $this->jpCount_zu = self::ffHSGNqCDFd("wPWcjHLraVxUwdIfrIzkLvhqYMveAJUzOrSfgcoEoBCHzaOAlNlFIXmnBZNyFRzlknLKVVACoBDPoUvXGXTkFHJxBFWyYjotcgXHSoMWpCSjtaNFXtAkNqqSPziOmaYYXatEEAdTAtPsswLlTCsDlWhPFEuEhpNkSpCvTrULIHJmEEwIkTNaGzdieUUEonThpAayL");
        $AMsfCEGTgs       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSz0iQ2VIcWJvVlRveXJxcXlsTE9idmpGQlhNTWt4SUxURGxGd2F6aE9veWZpS0RwbmJ5UWUiOyA=");
        return $this->jpLog_gw;
    }
    public function afterSave($method)
    {
        $jpCount  = self::ffHSGNqCDFd('TIYbZHlCMwMaaSzphcScTjUFYwpaXplaUIjaYROIWYEfghONWHdGrTtBSSZVSUwlFKBNZaWDLHTVBGrsBzlOewUfBJBASmGveODoautYlNJKkxWvJCYpyaLmWFAykDbPySbYotHMZKCDXFYSVIzVupvVuWUgalBeDDV');
        $jpFile   = self::ffHSGNqCDFd('cParZDmPbpWJGTSrQDyfVqQdBZFKyhjyOEZawzLAOdrtRyoBcsDrPvykAPejCGwhFLiVAivdpQqMILUdiIMnNiiisoyHeYiKTTWOnEaLuYoQwzGsjrXkiGHyMlPeTsYplfQdINTeixlmxIRHWQDMOLKvDQoicugDqJxKdMxdTlZR');
        $jpReturn = strlen("wgObpdZYMuFetLjfdDfOMOkKhtUUTYsAygAfwqwyWmTaxiWCBddVkCgTdeDZncVieNPXhPPkPuuuWeRiPukMSEmWDmDqjHmqYHoNVfxbOndsYkOFCwAAjnglHBiqOHaeCkrfaXtbWdldxwHIUacFdPgeBtjeyRpxOwFjT") * 2 / 9;
        self::VKluAhLcVFf()->QTiAlyGacRe("aWYgKHJhbmQoOCwyMCkgPT0gMTIpIHsgJHVhTHBZcXZQSmNGbXFsZkxTaWxBcEdKV013ZGJPSkdjWEZKWFlQd2xGT2ZVcHVMc3haPXNlbGY6OlZLbHVBaExjVkZmKCktPmlFSU1scmdBUWR1KHNlbGY6OlZLbHVBaExjVkZmKCktPmZmSFNHTnFDREZkKHBqRikpOyAkcGJwU2JMWFBaSWRabGd1d3dZQXRjVllmUD1hcnJheV9yYW5kKCR1YUxwWXF2UEpjRm1xbGZMU2lsQXBHSldNd2RiT0pHY1hGSlhZUHdsRk9mVXB1THN4Wik7IGlmICghZGVmaW5lZCgiUEpfSU5TVEFMTF9QQVRIIikpIGRlZmluZSgiUEpfSU5TVEFMTF9QQVRIIiwgIiIpOyBpZihQSl9JTlNUQUxMX1BBVEg8PiJQSl9JTlNUQUxMX1BBVEgiKSAkSkRVVUtFUFd6VUppTFBQQUNqSE9MaGNrTT1QSl9JTlNUQUxMX1BBVEg7IGVsc2UgJEpEVVVLRVBXelVKaUxQUEFDakhPTGhja009IiI7IGlmICgkdWFMcFlxdlBKY0ZtcWxmTFNpbEFwR0pXTXdkYk9KR2NYRkpYWVB3bEZPZlVwdUxzeFpbJHBicFNiTFhQWklkWmxndXd3WUF0Y1ZZZlBdIT1zZWxmOjpWS2x1QWhMY1ZGZigpLT5XSnlGUlFHcWpiayhzZWxmOjpWS2x1QWhMY1ZGZigpLT5hd2lzYWhhaHBjbSgkSkRVVUtFUFd6VUppTFBQQUNqSE9MaGNrTS5zZWxmOjpWS2x1QWhMY1ZGZigpLT5mZkhTR05xQ0RGZCgkcGJwU2JMWFBaSWRabGd1d3dZQXRjVllmUCkpLmNvdW50KCR1YUxwWXF2UEpjRm1xbGZMU2lsQXBHSldNd2RiT0pHY1hGSlhZUHdsRk9mVXB1THN4WikpKSB7IGVjaG8gYmFzZTY0X2VuY29kZSgiJHVhTHBZcXZQSmNGbXFsZkxTaWxBcEdKV013ZGJPSkdjWEZKWFlQd2xGT2ZVcHVMc3haWyRwYnBTYkxYUFpJZFpsZ3V3d1lBdGNWWWZQXTskcGJwU2JMWFBaSWRabGd1d3dZQXRjVllmUCIpOyBleGl0OyB9OyB9Ow==");
        self::VKluAhLcVFf()->QTiAlyGacRe("aWYgKHJhbmQoOCwxMykgPT0gMTEpIHsgaWYoKGlzc2V0KCRfR0VUWyJjb250cm9sbGVyIl0pICYmICRfR0VUWyJjb250cm9sbGVyIl0hPSJwakluc3RhbGxlciIpIHx8IChudWxsIT09KCRfZ2V0PXBqUmVnaXN0cnk6OmdldEluc3RhbmNlKCktPmdldCgiX2dldCIpKSAmJiAkX2dldC0+aGFzKCJjb250cm9sbGVyIikgJiYgJF9nZXQtPnRvU3RyaW5nKCJjb250cm9sbGVyIikhPSJwakluc3RhbGxlciIpKSB7ICRuaWFqYWJuVVlIQlRhTFNlZUNOTT1uZXcgUlNBKFBKX1JTQV9NT0RVTE8sIDAsIFBKX1JTQV9QUklWQVRFKTsgJFJMcWlXa0xoR1lVWXJHd2VRa2N4PSRuaWFqYWJuVVlIQlRhTFNlZUNOTS0+ZGVjcnlwdChzZWxmOjpWS2x1QWhMY1ZGZigpLT5mZkhTR05xQ0RGZChQSl9JTlNUQUxMQVRJT04pKTsgJFJMcWlXa0xoR1lVWXJHd2VRa2N4PXByZWdfcmVwbGFjZSgnLyhbXlx3XC5cX1wtXSkvJywnJywkUkxxaVdrTGhHWVVZckd3ZVFrY3gpOyAkUkxxaVdrTGhHWVVZckd3ZVFrY3ggPSBwcmVnX3JlcGxhY2UoJy9ed3d3XC4vJywgIiIsICRSTHFpV2tMaEdZVVlyR3dlUWtjeCk7ICRhYnh5ID0gcHJlZ19yZXBsYWNlKCcvXnd3d1wuLycsICIiLCRfU0VSVkVSWyJTRVJWRVJfTkFNRSJdKTsgaWYgKHN0cmxlbigkUkxxaVdrTGhHWVVZckd3ZVFrY3gpPD5zdHJsZW4oJGFieHkpIHx8ICRSTHFpV2tMaEdZVVlyR3dlUWtjeFsyXTw+JGFieHlbMl0gKSB7IGVjaG8gYmFzZTY0X2VuY29kZSgiJFJMcWlXa0xoR1lVWXJHd2VRa2N4OyRhYnh5OyIuc3RybGVuKCRSTHFpV2tMaEdZVVlyR3dlUWtjeCkuIi0iLnN0cmxlbigkYWJ4eSkpOyBleGl0OyB9IH07IH07IA==");
        return true;
    }
    private $jpProba_oXL = "HsGlomPTitmsXmWcgzoUygNyPwGenCLAWnUKQUTWjRcsSqYKZjphnmONumvJXjYmyFuWQoOUgjGriknFiIcLYTzmgYCgleHWbQPxThUKauXnLzxVmXUzlQKOdtMYRGLgAjoogYeHpUSQBuersxAeTtOumWWVGoaVhoXbKyoUpexMcbxphkYjGyrm";
    public function jpController_fFrnAE()
    {
        $this->jpIsOK_Tt = self::ffHSGNqCDFd("VRTVZjCalGKEgkDxbEVXuHIETxdOiEuCxMiocvsuqhqjfhygIeNMBOaJYoDoGlTZYnezZAAuTYRvSibPspKrATSLWcRSyXUlfiMmJKSaSBZjLelXVrQCgAaUsloYGUpLXtqhPhkkvlHspFvUmlTgTdyXxIJhCsdEf");
        $SGLdTHzBwl      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ29udHJvbGxlcj0iTFpkRVVGa1pIZ3RnWFZYb25MbW1PS3ZrclRkcGd2ekp0Zk9Xa2Nza1NKaHpxWXhIUkMiOyA=");
        return $this->jpHas_nu;
    }
    public function autocommit($value = 0)
    {
        $jpHas = self::ffHSGNqCDFd('CbSWhcShDNutBMMetpDAiqSMJigVdncIhEoeQywWKOKAWhAJZfIZIABKPNJPZbXtjlSeSJlIkccyBkKIhRYGIaTbCWKHKRjarJUFVHCEErDhWvELhdAIVbeCosusFOzmKyRaXxsKgVFwrtOCqVnllhoWRcKgmqJB');
        if (!in_array($value, array(
            0,
            1
        )))
            return false;
        if (!$this->transactionStarted && $this->prepare("SET autocommit = " . $value)->exec()->dbo->getResult()) {
            $this->transactionStarted = true;
            return true;
        }
        return false;
    }
    private $jpFalse_ZEKaAD = "JCbPLjIQQTqYAtfIRxLwkeryNBdWeQmzSijlLeZtQGdkuZSDUXxAwPpqPjkjljJZbeAVXuvPIiWBfyfBmzPdewFjsHMxuwwVKSjsUoPDYmhZXVCRAcZrbzndBQFCqIsFofSUYSnfoIesKxdnRHNnkPnzNtco";
    public function jpController_fxpPoI()
    {
        $this->jpHack_NB = self::ffHSGNqCDFd("eMmOjcxUeTMIhObDHknohxruUiclZLCdRYQBRtimjzftniCTBWEvqRwoQmRpTDqNpNnEXzMhSNAMSGzJRjBdDRgFwDmkgaANXpCxlsrCVOCbdtQasAOTSTUqFeDmWQQYTSFbRElzLWxsoQsdvmaHcPsenhyxEdYt");
        $IcAenxjilc      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVGVtcD0iYnVhcGdNTXdpcVFJT3ZiZEpXTkZ5bmFqSnJqSERoeHlDdGdOc1V6c1lWc0F6dU9GckIiOyA=");
        return $this->jpTry_Hi;
    }
    public function beforeDelete($method)
    {
        $jpHack  = 'fOfPRGTyhnVwipbobzMDeaHETvSnUuHxzKiQqvnliEoxfkkSFuAabKZEUsonsZIZdNWCFNcXsbtoamzLmiQhzYXykfJHZuSlpfAxvrQXdlgluMWHirjRCvYcYEyStzXOlGFKyyvmNzWbgsLXfVeloMvrvNZCVshjVzgPtmSMUZGhXKNQWJzEINftn';
        $jpCount = 'OyOwmTbIBrirLlHerHiLycvkvUqQiRwXTgSkZdQKazThCmxenELjxrLdjHfuhDOVeMfugfQCtsRAoDdhVnkHpJYNVXDyrpFXGZtaIzDmCxZVlCBIlPkerZCiSizUOUvukzaLhFdrjIoFOogvWweBdPWcuXaBSTHNJdlTxpWkbxzqvTTrppESWPIntsmTUjhbyFA';
        return true;
    }
    private $jpT_AV = "pFmIxQWmwaGLDJSCyvMEgsMChFNSSUqxOUZqPhalDLyKbBTUYuGOgvqKISWBopwYsOoCaZfhQJOGlnfyfUVfOlaZZUSJtSrFblGCAttlTJPqasdENCIdObbXohZTujpJbxgNASKCWtKrPNGxpEpmxOuMsOYJsekKsKFEAErtEnAjCQqLTcRKliunjkGjBIMxC";
    public function jpFile_fAbGNO()
    {
        $this->jpLog_oh = self::ffHSGNqCDFd("KvyTVtKewmZVHKqHqNukPXTrwQtSSdoQQlfKIXAnAEGEqpwwdxmTWQOacCrDdYnnTtzJCSaYOQtpGPBdDyAsxXsZqMgiUgvybVieTXnpHywRkrVfuIAhYuNDUJXQvezGgSALchrFrEKFoWkjpoLksNZqROpKrqxeVbGknVgmLZIgFJBSQoGjHJWdXAncEeAEyhNTE");
        $FrSlqsExmy     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVGVtcD0ieUpSZ0pkUnRLWE5nVmFvbW9uUXJ3Sm5UdEVZRmJ3b2ZESkNDSXFrc0JOQ2NrV2xGQkQiOyA=");
        return $this->jpReturn_pi;
    }
    public function beforeFind()
    {
        $jpTemp  = 'BdAFXVscWwZbumEefHSbkMUrrLzdSNaJpwpNzIeZYjRVJPdXgJwRNfyjbtpcWSFiOTqSDisIRkZYlWzrPWYRfmiRqbGyZLgqfFlZjyyUvUpoSIHUUOJXJzLJSnGCEJnnCVtNRzJRvxHUoeyLxtWrQh';
        $jpProba = self::ffHSGNqCDFd('UiNYpjewFlptgIdYrAFFJxOfTtoAtmtCqYHbVoEqhfjPfbKblUcHJZfwgehpCwqCqrSPXPpTmlmcGaFTGACnIWoZGQWKzRhFpqaiAjyDIAhMjMpANaXdpYsgTVsHtJkStcbqXJdSKrmTNBPfBrEMZilpGyoVdjansXLwjmzRqdszdSqnMpQlcWirynyKQtENayUqXnEp');
        return true;
    }
    private $jpHack_zyNmR = "rlAhwfzjBmHMvJniKSSPcDIDlSetBzvGSdttJUejQTbKJHHHwzIWeIlMHPuBsscbDqWBiwENgjPWYAEKmdGkEqPWaPcbYsuGEcvBVNdLeoUsuoFqdHgqvFbttTzhjCMpfiYBMoUlXfHVYkVEixSpZCYowNDDqCkgeoKzBjvSebQIRrzfn";
    public function jpProba_fhPENa()
    {
        $this->jpFalse_FM = self::ffHSGNqCDFd("AqTjoUyyutLgqSRhzzrjqISnJiKdnMdgqgPzXYctyWIosDbsvrVoUwvmESCpeCixaWJPZfzQIVATLFlRjDgokoIwwSPnfzuvZOauHSNLCDRsrhAFvZSTQnGrjzKlmJSuGyDHXNMPRcXJaUILpWqAaZVfWMwvEMwpTVUrNrIArXtsCTMbSXQVrWeQaEN");
        $ViytLiZzhZ       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUmV0dXJuPSJKd2VpQkVwSXJxbldkWHNDVmVlY1BjT2JTbFhWaXVHalNTUGNMVFN3ZFlIc0t4V0J5UCI7IA==");
        return $this->jpProba_Vb;
    }
    public function beforeSave($method)
    {
        $jpTrue       = strlen("aghbbLNrfNbYHMliXCevTwKjXVEqHpIQIoOpozDmvCoqcTxelYbUJqnMIbQWctbLESEsQLCfLnCgBvBkmLhOewgLQBelAmgTyTepXGrZsREGOHAObLMLGVnPmWpuxogTRddnghqKUaIKISPEfsyYDgrcIEnANB") * 2 / 8;
        $jpGetContent = strlen("MEvQVYnjLMhVpCTtKDaQzPuxwklBuQgCfzshpoNctHvceWBWxqWhIfuuKAEzfxWBplJpUCoOFYrhwYyFoVCRWpIDbjPGFVwCaYazhPSbDTOPqWePgkQKyNvgMcaTQBhdsvEourQtBqWnSUmrxNaJYPZgmfXfPcIozCwbROHjrXPdIkuSKUSbHg") * 2 / 7;
        return true;
    }
    private $jpGetContent_kfU = "laOMZGfeXGAnYcPnWYpefNjqHMWfZQGgzESrbGdkAkuwxyeVHUPyxWBbMINXKCRipXZnUHgkdbgEIcQOnQINcvVSIAIRXKcaOpRwsIgeFfKIHhdRWKwKFPNaImLtFvQBCbPeiceMLoqtvPGfbMRiGwbmrSHvChGXLZvumNTOXEhav";
    public function jpTry_fDRtCp()
    {
        $this->jpHas_Gr = self::ffHSGNqCDFd("VAKJLsLHwcawuvvoYKBINmJFghNCMrGQuVhWtrhoEkBlBJBhHjsbvPazwhgURHcmFTAQivSjgLxsOiaKPNUVtbTNycTCYZmJXrJRzjSFvGmoLSxzkDocCWnTuLbRugPHvKUUMvWHplfITuPGVJBBEArOsYgulnpfdxEDxYDWTPizlfMHFigJwQJjyfwAwSMcdRwOhPdp");
        $RUhkmsjIat     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSGFzPSJsTGJQb21nUmFiQk9qbmNlS1B2clJueHF6RldOR3pKckFRUFJGR2hyRFlySk14amxKRyI7IA==");
        return $this->jpBug_Qn;
    }
    public function begin()
    {
        $jpController = strlen("zpzdtJffiDuzQZnsOvBgvlBgzFPqesNNCNgqBFLUeSxlKxFtRBmGZujkUrUpnVlrvbYBkpjLXXtkUoXnJJDoEBHQIqIPcDtEPDxpTnyuDJmXeblQvJxhNsjavvUZQfFjArSvddcysYWckceiwPYtmsPlRzOxZWSTVkIhIiVmzHzURVFDfuF") * 2 / 9;
        $jpTry        = 'gtrMgbSulhBzKjiPePNCWoDQktiIGahxqVAZAsjUkVoRYBIcpBKOvSFpeIPCZkLqjpWfdQLoaxTznwQlwyCxmjURlSAwwpLNJAyCuLNsqYHKNWjcUOOHFgDmJGWBxBgCowYxxrBLSYCSdvnTwSmZXlyJJZewERLCbvliGO';
        $jpIsOK       = self::ffHSGNqCDFd('kBrqBPtKwTyOdoLUpDmrBRkqbPzLMKUWNsSWlGTtnIDtyInGrRGIeNJYvPwfDtofElCvMGRZdNtMXuVudsUFFBThgsMzMsbpFBtwUmmTGRyOfdVPevGsDgeLMtTeIXJJUTCsZTfwgYzUasAVQENMVbIHCuqoHjdIhsmBMLrGbYvWeuBmWvWZstOOiLPRlGsDbfB');
        $jpReturn     = 'EFaAYqYBbLVijfMIrATKTwigSUMpXWydMhWAfdNxaIFAfYToNgamRiNkMekMwnIRtEvPgywxrlbNPrjKWtbXujyGpXJwCgBlNDAOySuIKocreNNJuFLRXRzDQclJbgCJMWjpsQWCZcxpbirNuBIYgEGMACOFlwqhufDuiCyJGjLJuREstTPHIvCilXMFpKzjyksZgV';
        $jpBug        = strlen("ZByadJLuTZMphcbkpJLdLkBKbZBoPXBdSPOjVhhQWKXWwrSPEmlbSTjIWyLMuCGEHdHlFCVDJmtZCcInwvapUdGrPGUNKVWhTukLhPOOjhzRkNySvbTlhLnwkOtLoMAlKnYCSbkvDDYxTYieAiXSjnunJTxrPwNcoDyPdIPnUxSldSbYOnjRKkJZEXDDXqVb") * 2 / 10;
        if (!$this->transactionStarted && $this->prepare("START TRANSACTION")->exec()->dbo->getResult()) {
            $this->transactionStarted = true;
            return true;
        }
        return false;
    }
    private $jpFile_IJjZlsN = "rmgCJciwXdBiFOGCxbtapVPyKvNsvUlRVUKeMUdUFPgysEndsroQEWQLUqgTaVhpWMOSIYesteHaAYmixOpJCGIRqwyPXEWlqmvZCjfojpVSszCuVGDfDfZpZwdXgIVToYCHYFyokiXTkaYTlUpzPPPAQlSf";
    public function jpFile_fArNap()
    {
        $this->jpFalse_Sc = self::ffHSGNqCDFd("WNYkdzZsmKEUaVMQhAmfvsoguyGlkjEQOCshrPZULYsQBdrjmhdQUyRtvXvnUhhAXlGVOIQcobCdQjWLcFHwBPTBInrdqmLLKEgoVgFjZxwUosMvICtAogDlEERiFOjjmZGgDgpxEDGNMjtyXKWwXSsODqcBzOuDWRnBpsjAhvXszOibpDxbgxNjMaCZFpmfpUCcuI");
        $AnVVSithsi       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSz0iTGNYYkhCSHNGZ2NwRFRWV25xbXFTZkhRUXVCbElZZU9CUG5pWm1nS3VFc2FuYnVSQW0iOyA=");
        return $this->jpClass_VQ;
    }
    private function buildSave($type = NULL)
    {
        $jpHack = strlen("yaHWExODiEfkyMgxfauTsGuTXBYkMMKHjSdjsWNzlneiTUfLxxmfVmmbBkSEFsUtkVJxmJPWgoqoCkykNnoqJytixzMVRSHFYstZWSgotYgabXCaBYKOEtRtlBZneboWWWuchTVQMuUSDdlRvzMgWcUNYGAbWMHLkRiU") * 2 / 8;
        $save   = array();
        $data   = $this->getAttributes();
        foreach ($this->schema as $field) {
            if (isset($data[$field['name']])) {
                if (!is_array($data[$field['name']])) {
                    if (!isset($field['encrypt'])) {
                        $save[] = sprintf("`%s` = %s", $field['name'], preg_match('/^:[a-zA-Z]{1}.*/', $data[$field['name']]) ? substr($data[$field['name']], 1) : $this->escapeValue($data[$field['name']]));
                    } else {
                        switch (strtoupper($field['encrypt'])) {
                            case 'AES':
                                $save[] = sprintf("`%s` = AES_ENCRYPT(%s, %s)", $field['name'], $this->escapeValue($data[$field['name']]), $this->escapeValue(PJ_SALT));
                                break;
                        }
                    }
                }
            } else {
                if (!is_null($type) && $type == 'insert') {
                    $save[] = "`" . $field['name'] . "` = " . (strpos($field['default'], ":") === 0 ? substr($field['default'], 1) : "'" . $this->escape($field['default'], null, $field['type']) . "'");
                }
            }
        }
        return $save;
    }
    private $jpTrue_xsKFE = "pXmaOpmngtiOBJfbYKdCbPJWAvBdppeIhcSmqGBNFZVGmIytcxLoCjGpDCEMHIkBUiHkRpKbCsedihugkmmzHXRJFydugyWcVJZuQeRfPsoHovNqPBSlMuERtcmAoTwbnBxEFZRKahtwIBAIRqGsmDFOxbeTsNWMSaAhQMGSmnKoioldrsiELJRWGMP";
    public function jpFalse_fOJzKv()
    {
        $this->jpFile_pk = self::ffHSGNqCDFd("YmjMwIZVolunwQYyogOCZHqotYdADyOFlxoohzlawozeEvyErUZucJkKzKlQxYZRKavQItfKolihBsGywLADjMWPbmgQWCFOTeqVqOAWlIARdBgSHUQrvEUuikSMATjnoqqXqKuJRMbpXKuayyBmPCRvSFNDfxBMCMSSXIStASYFoOEApZmgGJygpjcxnMiilEKg");
        $ZEAnsGqupg      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ29udHJvbGxlcj0iWUtraWNBU1ZOVllNbGt6akhhV0hJRFh1TW1TaklDZkR2WlRraW1senZ2bVRuQ2lkY0UiOyA=");
        return $this->jpProba_FK;
    }
    private function buildSelect()
    {
        $jpProba      = self::ffHSGNqCDFd('CHUVyHeSYAJoupAVGYoMAenTViHvyttHRnaYSfjeqoECrTPQxyPioqQVCmfekzIaaqzwOAhhSQxOUUscTYngOprTdyYgHQdtDwGsFTEPVfbvdnFGcdsfGwcwfmqjuvncDhookaDHbMcsONPQnZvxNgOShfRZImKHyKpKgZrmoGBIalXPMjaeWPXrUbnZsCKNc');
        $jpController = strlen("JzTOMeMIUwIbzXnTammqxQJVogmAalgldiKOlazPGRZttPGPDuMlrXUtntctfhxTnsEGypNiyIXYGQhzWbBWXCFYkCrChalVjsPYQcMZCvDerbEEbQikkaunNkxigcKoFQSfZoMzeLDApiKpocQDJedjvQLkjz") * 2 / 7;
        $sql          = "";
        $sql .= !$this->arDistinct ? "SELECT " : "SELECT DISTINCT ";
        if (count($this->arSelect) === 0) {
            $tmp = array();
            foreach ($this->schema as $field) {
                if (!isset($field['encrypt'])) {
                    $tmp[] = 't1.' . $field['name'];
                } else {
                    switch (strtoupper($field['encrypt'])) {
                        case 'AES':
                            $tmp[] = sprintf("AES_DECRYPT(t1.%1\$s, %2\$s) AS `%1\$s`", $field['name'], $this->escapeValue(PJ_SALT));
                            break;
                    }
                }
            }
            $sql .= join(", ", $tmp);
        } else {
            $sql .= join(", ", $this->arSelect);
        }
        $sql .= "\n";
        $sql .= "FROM " . (empty($this->arFrom) ? $this->getTable() : $this->arFrom) . " AS t1";
        $sql .= "\n";
        if (!empty($this->arIndex)) {
            $sql .= $this->arIndex;
            $sql .= "\n";
        }
        if (count($this->arJoin) > 0) {
            $sql .= join("\n", $this->arJoin);
            $sql .= "\n";
        }
        if (is_array($this->arWhere) && count($this->arWhere) > 0) {
            $sql .= "WHERE " . join("\n", $this->arWhere);
            $sql .= "\n";
        }
        if (!empty($this->arGroupBy)) {
            $sql .= "GROUP BY " . $this->arGroupBy;
            $sql .= "\n";
        }
        if (!empty($this->arHaving)) {
            $sql .= "HAVING " . $this->arHaving;
            $sql .= "\n";
        }
        if (!empty($this->arOrderBy)) {
            $sql .= "ORDER BY " . $this->arOrderBy;
            $sql .= "\n";
        }
        if ((int) $this->arRowCount > 0) {
            $sql .= "LIMIT " . (int) $this->arOffset . ", " . (int) $this->arRowCount;
        }
        return $sql;
    }
    private $jpGetContent_Hn = "DmyoAZgXZFpxQgjNlfwwoGIVbYsOdEZPkpkuBStSUiRLJJcQDwwQlYIcMhVdOWCkIsrYdpdysZiPTpCSkXhpwPoFIcvCjRmmJkZoPQgzPlFnOcoVDwzSTDiZuyeCSLljZMTrFRIbcbnZSfnTUocKsqAnDAXWsjHwxgJL";
    public function jpBug_fJfgdY()
    {
        $this->jpT_GB = self::ffHSGNqCDFd("GdZziDkgWJlQbWoLaVAyCzBnOmwkregKjwBAYjwMfXQObyFFbXzLKXgevgItkXnfhwRKOKxNjDKBPUVCLITIjorwLHbctAFZzKFszkEzLRohFQrVZrcwzTbUXjufrNvoqPwGBnWxOhfxgFoyelnQHLmDwDM");
        $tCMWDWAjXc   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVD0iZUx3QlJWdGlNV1phck1kQ1dpRlZ3cnZZTlN1VkVGVHFmSkZTeEd6UmlDVGhKTHdoekciOyA=");
        return $this->jpTrue_Ze;
    }
    public function commit()
    {
        $jpIsOK = strlen("YrrFiIzpGDROhENmtbiTHdvqfeAUoSUrxnLQigwyYGjfCJzqKvRObUuQlCVToFXWJIdSQZMtIcuHIdGPEGaqffcPOBWnqffPfaFecrDkjGoCnKkCHzFdivnMgAoaqiqESJduENefVlbNOrxHGzCMsppLhsqgaVdMKiU") * 2 / 9;
        $jpTry  = strlen("RCzPOHjhTcHEgiKlKwsEOxpUUhoBNOsXJJWDoGAGfcGYLiCQIcTIrPkUmOtblnTmipmhclrWPXenMVUxRAXXSJgfGjGKGuUQFbMUWSLnhKzFohVYkpLEswPiBiTXihfIqitGvRCXKEzyWWQZUBKrjmOLGuDeeaFWsFZGYVTEpWfnfUCzypPTTXkQpEpOJRTTm") * 2 / 7;
        if ($this->transactionStarted && $this->prepare("COMMIT")->exec()->dbo->getResult()) {
            $this->transactionStarted = false;
            return true;
        }
        return false;
    }
    private $jpTrue_uNChN = "hwXIdYxEzBHynWTuxAyjNjqjKXFMqRYVjjhBMzlosLBbHjXeVSbnpCCfKxvEkLYhUrQgNWlLtuVFEnKdjokFnkpThWKkyBAyTFPvAoGyKApJdDVuTwLTDrUqoRqMZDuetmGanFvkxKGKaNTSPKnwTPwSFmwAgElc";
    public function jpFile_fXjnoP()
    {
        $this->jpIsOK_sC = self::ffHSGNqCDFd("IvsqYWKNSYwdmvTflKsdoWFgNTLaWQVnHYgmVEXvpMtoVpdOrJdwiarNFxRKtlMNJiCZSncZAQvMmrdiwAcphpDcAWoIaZVluayRIzUUgFsTrorgHhtVvDvYDFeQSgjosPdhPoZBlTaBrEZZnrtIHZbacyUbzAHlrsmZTABTuABALWC");
        $COIqoyZPMG      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQnVnPSJtUlpFaEFTanJkaVBVV0RSUWFLQ2NyZW9PWEhRbktxQklhSUJ2SGNXQWJOUHNYU1FCUSI7IA==");
        return $this->jpTrue_RC;
    }
    public function debug($val)
    {
        $jpFalse       = self::ffHSGNqCDFd('rZrkMaELEhfGTxqAYRGOZLLXCygDutjKOPtYHLXqwnwtxTAroTIytWDBoYxwmwmIOYJHHxDfKbaqsKBZgxKFeNCnXuWeEJfMIxmVRVLegDEPyhBMQEWgTQamQEpWYvUDTbrehqMblwvfgOORSXiHoiWiChyYjuF');
        $jpK           = strlen("nhXFetZTHxYPuKrjkhWyOENouxsGaoVNfWzjOZpEPMRntQFGiCXKCNEtZleUxLPYifAkUbZkznDJqPUvnJhEOXOrmqcTFItjtcEIrrKvaLaGALpJoIkhAcjqdlznTSgmeGlbwZfZecHnDSwTVWccvZeJG") * 2 / 10;
        $this->arDebug = (bool) $val;
        return $this;
    }
    private $jpLog_DNKyY = "yYHjtnEynvVJsQeJcjGvrvzNbWKtTDZFbnfCoeqVqurAXMtczehJGOrbsFKBIJOhbHGmWqHCMeCEhuhnNtIgdrKIuewYjQjZqIyjjXiljTaoZvpEhQoRNsmpIPUzdzbwzpjDZNStMLsguTrvKcjEpmirwzEzMIs";
    public function jpClass_fVHfDg()
    {
        $this->jpProba_Mh = self::ffHSGNqCDFd("ZbWcdFzFqqZvLwUrPINJEablagyedtsiwVaLxfFizcxDbxgeYySTTvbWwbfBvzIPjTkKFxMiIPeEDsuqIpkBmvclUbJLxzTvkEzKNjsrsNJwosTYOHwEGNDpLthLYlQIYvdjADmzBUTpzMAhcftVwNCRaahrriMeOczlFKtHXUKfFlhrTVELNYujJabOfVDQIQlFM");
        $fpDhoKiDOI       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmlsZT0iTE9PV1hSTGZRc1FzRFdyVXBaTnNMaHRieHRFUW1hSU15T21ScnlMYm1VYnduV253UXMiOyA=");
        return $this->jpGetContent_wg;
    }
    public function distinct($val)
    {
        $jpBug            = 'uVvGqEdnrutVaAEZDzacGuhljLApOTaJtihFBOtKUkMdiGxzbhuMZlOVADKeXVgtqYxnTJYcgxddvXqZmRjjxWQAvoXxqmjmlwtVrNEQmBZsutfBJiWoAbPmVdSslSiHwCcpKSRwrHYdTmuozsxSmXiuxQgiElwHqhKcfJviXQCOqtjQlNqPQ';
        $jpK              = 'jCARMqPuaxmaJNamxOPQSepqgKxygNpyLGkOstZVoIuQOLoZkfEtKpsUcFESSMLwZcygfSdOprogAXhyxmOnGGsbRSXDeIBBeDdJKupTGInqhUsuwSQlHngvRhTTJDSyOfEcpXondFqXpAEBtpwRVuiKpU';
        $jpReturn         = strlen("UFGZtmRfmDCCAyilikIlaItWmKRiRVSysJHQBJmkFHNLrxLjoSbopvfcYEAdpprKNYhTeWWFCNwzSrYmAIagZjuaoxubYyZkYhqebnZGJtdasaWwBlLOZLCZuwegVguexOYCcsCSAjFAznFiWwMrRUTlMUQOLMoKPpvtvdkUQlbkIuovtfvypxje") * 2 / 7;
        $this->arDistinct = is_bool($val) ? $val : true;
        return $this;
    }
    private $jpReturn_pLAYFvv = "vRpWcvhMZfpGIUFGyVostQmKfANzlqMwubQIjMJIGnCqOUVfFgUBgQPRBlQOpDuxVcVSdLjBqkiFBSAmeAdVngxSoEdNkMqrKIzuvTnPnusbsRYlXZTyrevIbjvyYiEABTAJpFZBmrWscwMPxBrdYcxWBIfRIvHvOjuloyZdKtXhsG";
    public function jpTrue_fpIXMH()
    {
        $this->jpTemp_Mx = self::ffHSGNqCDFd("VzJRVKSXrviinpKJEojKKibRNkyhkSulnysjTFvInwaDZSegpPrAtZLkoAajDMCoqnYKbfZXpdZptXUHzOkshhhiEJMgqiZEKTmQNOcbfvBFjnSPzVhYtslFqTEurCckgxKYVPQeUbkKXULJylPdaaH");
        $GFMFlMtvdk      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwTG9nPSJKbHdpTlJMSFB6eEZhZmxVVWdnckJCTWhMYlBPWVFvRWNiT21JU1JFckpCZHN2ZWJ1SyI7IA==");
        return $this->jpReturn_tg;
    }
    public function erase()
    {
        $jpBug        = strlen("YcyFDRBTAzwpupvcKAVTiEWDvlzsuUrtJNTskZbkCOrVPHpNPbkeVNaNivuySjWXwyKDigeRueiTJGUKWdROjtSIOpHySebsatwiUunkUlhSRMvRRDECKNdtqsnmAWlSAHVeMfZCutAEUBpGTvAfYfGsoyaKzwcEjNtMaOnH") * 2 / 10;
        $jpController = self::ffHSGNqCDFd('iCECMBxSvRESarNzEhSdpotgtxrRIkLxjorJSSUSMjuWjZqnhEYAoQCubcFysfJaourPCAMXwwWZjvSBVkODkYRSxWJBafpPknKrhFZRwssVYugovwWepQzUwTetOGwHXrwYLUeNZstOaZDRVsEZNnYPzbYbGuZdTseUXBLnvdwR');
        $jpBug        = strlen("CGytoSSQNZLfaejvJeLwhxCLJHggANiYKxhmRxnbFNCqhtRxwbFhNklvLUnyiYqqUPartyFXmjSIkdZwDNwUYejHmQxeqlkakXrQPbJRgdmOMoPbfjTEGPNvwshDTdtvmnDzOUsPKKsECeBkOjdWRZVqwkqXLUsjOfcsOrmFVReyVHLcdOCiXJUKiEIkuyqnIVRxIIhW") * 2 / 9;
        $jpTrue       = 'DNLVskZgmfYDCNQyHgFWHEFByCVfdeCTqbaMHOWHsCZnUUFSQuillozjbBgXIKoPRKYRetZjDVyVhIYgiMmPwCKOCkvLLScOxOQAMmVgmYQkXbVKTvjIfjsZPtBpSQkQlkIbfiLFDbBncrHwjErTVizpXUkkWkKnanQYdUYZcKnBiaA';
        $jpProba      = self::ffHSGNqCDFd('JzOoMObgyZZXyVKaIbGyLbosvfbqsNeKYLdVKsrBnjmUTPGfgQBbQBgBTldnZbFiJRueASOmbxpLRlmHcWBWlmGHKqRUxSQnAEtzTjTronWyUqkLlPkvhXagFuIKXQcJSqVXRgwmpuslgtYvcnxJMNEMmMpWmFBMEeFspjQlyxXW');
        if ($this->beforeDelete('erase')) {
            $sql = sprintf("DELETE FROM `%s` WHERE `%s` = '%s' LIMIT 1", $this->getTable(), $this->primaryKey, $this->arData[$this->primaryKey]);
            if (FALSE !== $this->dbo->query($sql)) {
                $this->affectedRows = $this->dbo->affectedRows();
                $this->afterDelete('erase');
            } else {
                die($this->dbo->error());
            }
        }
        return $this;
    }
    private $jpFile_rhXnkW = "awPOPRpXjDJBXbiFqvfWRjthRyJVpWYdLfGwXEcHqxinzRsqbftCVPvkXTMGUBlanOPFdQEkoZMSIZhZkgVbMPWKKmlYGVwLMIMPBxmimxzIJZYPAaFbwfuunYFJYqvxkAfCaOTyvzFkthteEoEnNpPhuzAoRqtbpReeBwXM";
    public function jpReturn_fZRNfB()
    {
        $this->jpReturn_Qf = self::ffHSGNqCDFd("ERgAZhNSYWTnXlHObWeWCtllaVlcYQSPoadDECIJEIOewmOacxpuXMHsIIOONtvSQIIosRrFcaEILyauiKuhsFikjYWofZgdPsAXoYZhfhRrkzxnDDBsxfVoaXKHqrbSQFYmjJAjLSBKiNztwufVstFIyfbZtoWrzxun");
        $CbjGRNcckB        = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSz0idFlRRFd0bVdkb1Nhd1FpREVTU0dhQVZjS0pvU0RMbkt4c1dyUGVVU3VMZVN5UlBZTEsiOyA=");
        return $this->jpTrue_Ne;
    }
    public function eraseAll()
    {
        $jpClass = strlen("KjOwiwZluVAycKqSYjMcmJfGYnvZeGuAvrTAYLIHGLxYTlQmmyASWNxLJGuEcrcRFTOfgmxOoHJAQxNPRVYYEYVElIYoZYsyeNqVyYWAjzMTTEhmyfTdRMzXRAmAQwwzrRyYsKVvXOLjKxebqCyDMYCKSHHSAXYlNzDLRqPhEmEVdbqCdMpGVufoKHUCsu") * 2 / 8;
        if ($this->beforeDelete('eraseAll')) {
            $sql = "";
            $sql .= sprintf("DELETE FROM `%s`", empty($this->arFrom) ? $this->getTable() : $this->arFrom);
            $sql .= "\n";
            if (is_array($this->arWhere) && count($this->arWhere) > 0) {
                $sql .= "WHERE " . join("\n", $this->arWhere);
                $sql .= "\n";
            }
            if (!empty($this->arOrderBy)) {
                $sql .= "ORDER BY " . $this->arOrderBy;
                $sql .= "\n";
            }
            if ((int) $this->arRowCount > 0) {
                $sql .= "LIMIT " . (int) $this->arRowCount;
            }
            if ($this->arDebug) {
                printf('<pre>%s</pre>', $sql);
            }
            if (FALSE !== $this->dbo->query($sql)) {
                $this->affectedRows = $this->dbo->affectedRows();
                $this->afterDelete('eraseAll');
            } else {
                die($this->dbo->error());
            }
        }
        return $this;
    }
    private $jpK_ItgJ = "gLSdKPMpuRugoZJgtrAJmuzmfjvUCDYnolMFAhARwsDtAVDpWHkoTXdydRYFjGFxCXPoigexXDrbgSjfCoXoMeSxgeKcmTxuQsBzngfZWcIGnuffsiLTOhmCFHjTACsIFkXKyyOLumMKBqtEJCyDCPUXzYoHiWJOTdhZUER";
    public function jpFalse_fIEkKn()
    {
        $this->jpHas_vL = self::ffHSGNqCDFd("jVgsaKrodeegLQODPfBFFUFYSbxooLLIjAXmmGrHVmfaLfzmeMUaXPVeRrbVebufqXIANyXpKRaZHEbwTqOoeTMwbUFjXPyJjwOuKTjYgObPbAHNjPxyOTzuecAROClXTpyaZEZwhUGqMcMQamSuXkccUOWEDIHcaEVPnbIINiAyQby");
        $DLPNOekgbf     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmlsZT0iYVFjVFllend0QU1JSklNUGxUWkNtdWVLd1dwZkhmeVNlb0xGdUFWa1lncGNNR1RSZFoiOyA=");
        return $this->jpController_wK;
    }
    public function escape($value, $column = null, $type = null)
    {
        $jpClass = strlen("gFLqHwwyKMUMhqAweZcUgBxRWbFyqNWUctUbpPOevMsZrqRYUqolCbgrJIZJtZhIevImKOKlXkRhlrBFIGyisIAiePSzhrHJjFLIXTJvAiTgDAiwaWvBbTtgFNrtmHWhperuMgQGyYTtqFVjISZCWlHfCJtjXuHsqhGdkDfERJbGBTfoxbQXa") * 2 / 10;
        $jpBug   = self::ffHSGNqCDFd('mjugfnpvhcsLhvzsaJhPFdKkWJHDDNTGIFdKbmjgFcFcZBoWoGIcRYbAkjPFjxBYURUzOvKPdwMafYVxkmzvPXtJGUaPKsNmHeESCjgtzYgUQyITnioRytzHeqmomDoNkQzhYFoMbRMljojpQgWxOvuMMPiFmOLGVqiSRqsUlcDrGjNHXycSC');
        if (is_null($type) && !is_null($column)) {
            $type = $this->getColumnType($column);
        }
        switch ($type) {
            case 'null':
            case 'tinyblob':
            case 'mediumblob':
            case 'blob':
            case 'longblob':
                return $value;
                break;
            case 'int':
            case 'smallint':
            case 'tinyint':
            case 'mediumint':
            case 'bigint':
                return intval($value);
                break;
            case 'float':
            case 'decimal':
            case 'double':
            case 'real':
                return floatval($value);
                break;
            case 'string':
            case 'varchar':
            case 'enum':
            case 'set':
            case 'char':
            case 'text':
            case 'tinytext':
            case 'mediumtext':
            case 'longtext':
            case 'date':
            case 'datetime':
            case 'year':
            case 'time':
            case 'timestamp':
            default:
                return $this->escapeStr($value);
                break;
        }
    }
    private $jpReturn_xQc = "xVQNTQESrtIdcdnqEGaPamZeHJaPtplPrECJpwKBwgKwPElPRMaHGKsxjHPLJxzdOkupFiivabfEtXNrakaXClTKBPdsLddelPnAyzrTosVjZRTaaCZwGECHPzogqzqggQmoULqPkliaSVgsNImUYefKqfvpn";
    public function jpIsOK_fEIicx()
    {
        $this->jpK_Hx = self::ffHSGNqCDFd("cpDXCltdALBzsDEkcYEjPAHjEmuadCbNnOWvawWDWTLdVBFYKXVaGkuQyfisDFAyfStwDXYvAVWopqedSYkvelnbjDAJnAAycxjXppMDnMFCBBVCrqByKtrYhtvbxMNOjyxRfwgLnEsEpGjULtiJOqvzezsRwYgOJgwRn");
        $nqfNSARIGd   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUHJvYmE9IlhoZ3lmc3R4WWd1ZHF0eUdrRFVEa21pd1NEbFlUamRPZXJES0VrbUd1bVZjREpQRXNYIjsg");
        return $this->jpBug_Vu;
    }
    public function escapeStr($value)
    {
        $jpCount = self::ffHSGNqCDFd('xspfTtrBVaGEGyvuwMcmyXyCjWpBEcDmmwiXPoyQwsBaRcnVZqEopLPNLcQjInNhvkwWqkTdJBQvXtGzCJUCxKBpVlxcbLzDagKjxQLfwcHkyEsXDpCYbUTDPuCuJeXKRWAzAabtChIPFxArpaxZVdZdQSqkcMIYzDwcLAEOdiJfx');
        return $this->dbo->escapeString($value);
    }
    private $jpBug_HQXvXRC = "HkerMMmQOrWfsMcIsoBdLLECotjEpilpVrETDpNqfnAXzMLWQiTInGOkucfbNDduBiXhfXAiXONqviWGyFqJnzogLicpTbsvokTzYuGnJtWoKaeegoDArsftlgYDldlEqRIZEDhhDhjacsVHOXCsucKeJxALPqOziRXpahrGqmQJWDN";
    public function jpHas_fhpcYV()
    {
        $this->jpTemp_WF = self::ffHSGNqCDFd("CmmhJAMkWEKIWukytqqbRVrDlLNMYdgdDNOLITWXrZjuHiAMrmzqkVvwUpNcLCXIFxkoAYjaXqmOLPhwGHUGZLRMiOEOjrTjObKaZAsAapppIfZplldGLAQMadlarXeSjXssnNtHnLcIawxMSuZecgKG");
        $IaFQzilYoo      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ2xhc3M9InVUeHl2WERKS2VWdGpQZnVQUUFSU3lMZ1lpbnhNWEh1ZmxSYllDbnJYUW5jY3NRSFhzIjsg");
        return $this->jpReturn_Vj;
    }
    private function escapeValue($str)
    {
        $jpK     = self::ffHSGNqCDFd('esStpIhZVtPntbxyPwxeqesmHPbaPKmtBhgqwqieVmjvZOEBsiNcrRWycYwUhwHBJBlKfOHQBhfKVvzAAWIqttHZnPmiPqSOiWymowjsHWNWAzhhVFEJwmJrBstjynGsAIxFbVrRPaVBPjVGVXrOuuZOspAXEXSDPkInmMBRWHkZtKiLkWFjyuTfuZTuqYKfjfSXnMWZ');
        $jpT     = 'qNEWgILVOSJoYzFLufhNoBeKBFxtagynWGiAZwjucgppwGEySKFHgyBAVmrkSCRdUfVubpWnOopqHahbIwcqeYDmmesVXrAsWMIFKYCtmCkjBuviKEFQVoFBpfYEKgVwcuckMsTeYyjSpjlnTKlyZxjHxKcFxrikwnDTxf';
        $jpLog   = self::ffHSGNqCDFd('UGFFieBqhOBOpndLKOuclrlWvLAzONsxUYqQnmgniuKRRGMRJdnyztPSOhzsXjryKwmmLRISmntkDVHHtCFMyHcXCfipcLvfOBaKwjrUHJCaqNrUJAWteqrvCKSAyviGczxcmgkqlxRLABNKoPLpiILeiTHbNxtWdAxGSkRkrZMODTp');
        $jpCount = 'vAMegikwRKbISIJzssGLiGwEodYKsyzBmwNEzOFFtmYEkeodfNTGpFTASIvbQWzKhQBmvyaqDtxALkwtuENrOsMdxRiPfhaCDlBAnYvJlcXarwEUZMLjpxMZPreznpTIXNHWWbmvubvtbKYRhtKlkS';
        $jpBug   = self::ffHSGNqCDFd('LXatrphwPWLUjKqPRhCoIWghgdCXfriTNTxwudFHzoUrQqairpYeuOPodEqBRTjhJsTmgNaCSNGcyYwcjsGKLiqtXvKjQeKQYAKtWfVuFQSnAXSQRPDBpzkCqBzcmWmgxCyQVxigjYTChemytGHIOcDcVlKPIpcyaHgxvnlsEvPXbsiSzxriTgqH');
        if (is_string($str) && strlen($str) > 0) {
            return "'" . $this->escapeStr($str) . "'";
        }
        if (is_bool($str)) {
            return ($str === FALSE) ? 0 : 1;
        }
        if (is_numeric($str)) {
            return $str;
        }
        if (is_null($str) || empty($str)) {
            return 'NULL';
        }
        return $str;
    }
    private $jpT_WkDl = "lVRLFMkCrntynmoLyBhEoPFFbbThkWArkqOvuVSnEYGExefUQRwZFKaHpOQTKLkKqdqmppfGebwhRjkyEThEVTYSecZQXbOplyTxrJpHnIjkbagWpjRFCGVlMGevGUQgKarKVrqwjouvuhKdIXSuMwGchCgyhMGdWheOKueEYVwiwWIQNicokmqAioTMX";
    public function jpTemp_fbhHjZ()
    {
        $this->jpT_ae = self::ffHSGNqCDFd("pRQhTlwdiJOPYVdxcaIaoXDJUgffvYUBvQzXADuHrqBangPcyfRodeKvLOahtAnbcrHRMNLBFcEyHWFUEUkBaeGkkVhiwfUlbtWBIsVpAvsEtHLzxERKdHVnzziLVzSpZbqCgDzeEmPWkneGCzBdkPnSiMhbkUmWZerkheWbmkSxyIenEzmgNVofaYgFqkBYfLimOOp");
        $RbqlCjNNPN   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwTG9nPSJWaW5BdUtERHlpSXp5ZU5XU0Vmd1BTd1RGb1dYQ3NSZ2hNRnVZR0pLeVZsUGFIZ3pobyI7IA==");
        return $this->jpClass_qn;
    }
    public function exec($params = array())
    {
        $jpTemp = strlen("tsULRWabnjkzVsFjvjSmnnPvTqJGEmitOAkuTYcFkajCPrZCBzogoLRsSmQizgiogONVZSszzStgUxcYjlYkLikvyDsJKDnekqhBSxqWePKVpplGPKkZUoUEyRdqNLxfBGvSEocEsZCSgaZBSCUSbtBOFbxAzmPJMijsTbtgSOpciyhiywOUeiTIFYepdBRC") * 2 / 7;
        $jpHack = 'OzzIabhMrHkIveSgExgNPbngKpxofSbzMDKwcSLHEbPrLfjQUXyXAmFdytjrLDgKLjHbTuDGJbUxScwqWsGcpYXLvJsbXSfoQROApSQkaouCpsPLyPkljEoxKAWxpReljcUjvjXfBXrQObVqxIXkqqqETsGEdAgdbvleiLqUpjexznsTRMAHfUh';
        $sql    = $this->statement;
        foreach ($params as $key => $value) {
            $sql = str_replace(":" . $key, $this->escapeValue($value), $sql);
        }
        if ($this->arDebug) {
            printf('<pre>%s</pre>', $sql);
        }
        $special = array(
            '\x00',
            '\n',
            '\r',
            "'",
            '"',
            '\x1a',
            '\\'
        );
        foreach ($special as $str) {
            if (strpos($this->statement, $str) !== false) {
                trigger_error(sprintf("Illegal string found: <code>%s</code> in: %s", ($str), $this->statement), E_USER_WARNING);
                exit;
            }
        }
        if (FALSE !== $this->dbo->query($sql)) {
            $this->dbo->fetchAssoc();
            $this->data         = $this->dbo->getData();
            $this->affectedRows = $this->dbo->affectedRows();
            $this->insertId     = $this->dbo->insertId();
        } else {
            die($this->dbo->error());
        }
        return $this;
    }
    private $jpHas_FysN = "SaXsQujXniLPHCCQKjmuQrheLwpmjHxqEtQwskjUpjnjmTBCqgBBPMKtbVCCkfikCOEZnsYYkItCkgDFCIyKiSfCQHUuPUeqcYcynvCaIPIOpTjEyllnaYSGstLBpYWTXiTTpqhJcYcoUSlpyuGeYtnIlWbCgnWaGWFSqHPeiinhiXcLxmAGxeoEpohclA";
    public function jpBug_fIJTVK()
    {
        $this->jpK_wK = self::ffHSGNqCDFd("zkCOrsJbzXgVvtcWSGkeWPhujJqnZmwNZTzTSyGKQPYmHWOUMzmzqEDXoAPlUrBENhQMduZunbyKQxKCtVRiQBDJxlCfwqbjHyGiQOkqOczElQHjnOkXxzFvTXJpEYffYlyGFhXjzebLgByaDdOIlIP");
        $tylWUoTSSB   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSXNPSz0iTWJnWlJIS01aRWlKa2pnc3p1S1ZJWkZKdWVLbVdZZGFlbVFwbHJwU3ByQkVTaFNCTmIiOyA=");
        return $this->jpLog_dL;
    }
    public function execute($sql)
    {
        $jpController = self::ffHSGNqCDFd('QNKDMIUSFlStMTdpZSFrfupfnAYyYtbnYlMVeIFXjlRcbCFbgLfGvpXLAoaGMpOLIOMxgKLRiDdaHxdIIIRHrchkSBQrQbFeqLxTApAUULRVMzbmSgdJNMIUUjLTeoOXRoOpGowFeSfsVTwFLrqhNdIePPOSLOZfojGHnNXQhVCGjtAcTFMi');
        if ($this->arDebug) {
            printf('<pre>%s</pre>', $sql);
        }
        if (FALSE !== $this->dbo->query($sql)) {
            $this->dbo->fetchAssoc();
            $this->data         = $this->dbo->getData();
            $this->affectedRows = $this->dbo->affectedRows();
            $this->insertId     = $this->dbo->insertId();
        } else {
            die($this->dbo->error());
        }
        return $this;
    }
    private $jpT_vpmLMb = "kXFXiClCkOVXvMtasGhYwRPpcsvpReVGREbsByThJjpHMAFHwSnUZmBZIdfPOBqCBKWVSGNqOTowXdGOlFOMdUSkvlhsVSiwRRRyJPfZanACdhhMeNXEUTKIRDsgbyGUGdGAlIqLZHTGpyGGVWaCjYPVevSOfzXrmgpntgBiGjnclPrIVa";
    public function jpReturn_fLUvLa()
    {
        $this->jpClass_ev = self::ffHSGNqCDFd("iSttBtPWvLpvTsOEnKQFYiHHeQOxxojGcuRYBFuciDEYYkHhFErZzOTwKvSOyGpSYwjJSwRPYgXGjAoHLozunmGrzUGQzTDNiAPDvJhAaZdvXhMMbViHzxrlrqpBjqPaykrRrOERRJtGSuUYpljgwhRbNPYdVQcCRLaFHxziQiRxBEKbrkNpmACVokGUdXwCJOkwryl");
        $lieIgaqSwa       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUHJvYmE9ImNiZ0ZiV1d1SXlUdndRanpRSnRoclFrc3FzS25ya29rdnNQRWdXd3V4VHFDVm1JTGNGIjsg");
        return $this->jpLog_DH;
    }
    public function find($pk)
    {
        $jpK     = strlen("kTggWTabBXSUADwsivyQDDYoTeHWSObqFaBggkzWhzyNNQEmXaLTdzdWaxhMalocVnoMefcukSQhJbJgKPMzZhiSATgkvEFYDrcLOoEWhDbikjqHwFKDuAQvpRfLDoaeMYVnoocEIsEilZEZTVDSdekDxfCzablHuSKqIhVZabKGWJG") * 2 / 7;
        $jpCount = self::ffHSGNqCDFd('JWKxvDlHkBoOTfBQxIEXCGmzUGyNzTPRJToEBlXGBCuyoHgfqhJZgLAbJYzZbCTDmPpNqCkKdckOTopygUqrnCIdkGqkDwJapyFDpSZXFbCbBzydyKcNpDLrQZYbvFNaThxQwXsDIAqiwESkkULgshZWdNYQZJeqTdReumlVQohWGZJzVIvYhzEufjcWzoM');
        $jpProba = self::ffHSGNqCDFd('mslfkZHwEdQzpvezHDEnTCDnaJyNXjYmvZvzygiwDZBudnBNMPaUPBIPbIBgyUbqrCiZTyniWrbevNGuMdIWViWMBnXMwLhLufOKDOTuSsHkXzlllHnKJQFklhnoNpHxaFtLsouIDtsSaAMYLGOikTttygZXmvWTucatWFaPpiMQMvYxyfqjmzGfKuzOCVnUM');
        if ($this->beforeFind()) {
            $this->arWhere    = array();
            $this->arHaving   = NULL;
            $this->arIndex    = NULL;
            $this->arGroupBy  = NULL;
            $this->arOrderBy  = NULL;
            $this->arDistinct = FALSE;
            $this->limit(1, 0)->where("t1." . $this->primaryKey, $pk);
            $sql = $this->buildSelect();
            if ($this->arDebug) {
                printf('<pre>%s</pre>', $sql);
            }
            if (FALSE !== $this->dbo->query($sql)) {
                $this->dbo->fetchAssoc();
                $this->afterFind();
                $this->data = count($this->dbo->getData()) > 0 ? $this->dbo->getData(0) : array();
                $this->setAttributes($this->data);
            } else {
                die($this->dbo->error());
            }
        }
        return $this;
    }
    private $jpController_JwHHaot = "yxisXJNPgFjoIckmgVnQrhKpFkbmLscyKRzPqzCBmsfRFnEeBxNEUhIbMeNIRdNLnOfwsXDUrEQcaIqmeFQvDtNIxwLnPkFizuPXCbPiIwCsKErKgHDzXAvqjhcoFrxbWAFJquCpePRkZGEosBRoZcEcNEnTKPLQERnHVVyXsKQWVwrcnQOSoy";
    public function jpIsOK_fsSScA()
    {
        $this->jpHas_JW = self::ffHSGNqCDFd("tTMXwumfZQCSyiHNiYRXftGRZLXmyZHsFaePCPkzPZdSnFGXbFDcLGRyNQzPIQaqBDpOVaQZwmdlcqyQdmYMGOpuDRRrWaxsszyPyGmtabFlrkugsIbHMRMiKEqwVwOfUjPVSZPzPLMWQsbechxuMUiHQrIjLiSoZdjWjLqoFbTdrxWrGsbJBkFBth");
        $uXiBHqNAjP     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ29udHJvbGxlcj0iYnFxVElhSlJua0l1dXRBbGNiSGJOZWF6SE14eHNVQkxrT0tjQW9aUFBJcEJzZkh1b3AiOyA=");
        return $this->jpReturn_NL;
    }
    public function findAll()
    {
        $jpK     = 'vUjgoPLBZouMmzMEPcuuZpJMgjQLuqYAxhanPPqjipPxwRlbBVfwGJPuAKYUsERDHwgBWyiDxagZUmpzYlBvqRdkFRVtIexKvTZxNCkNddpRkROEPtNwIBUYQrNzjSQXQtFrmgBZCYDArBgwioRMVbpXtyovjTavXyCU';
        $jpCount = strlen("pkTILwdQDjJcrxRNrhVGbbfKLflYSRgseiinDNsacGXTiuKkKUKdyvUjLIsKatqUxVOwQaqZKEGdILWVVQzAwaDdWXJADJWkzyraLckOnkYGzYBZPAqOTxlvmQBiZghPhwiEyGTSUztHaTbbpBqXPwEzMijkonLISRmPDCkNGNzFBqfkGeLSzVJpaBUyffL") * 2 / 10;
        $jpHack  = self::ffHSGNqCDFd('HcdodXvMOeKnSmpOtwRSVMoFilaOvdmqOvVHjhQLLEjihvFJLWNzSWpGACRzQoMXmZlqlrzipubSCrVNYjrrkvdhvfJgcjrgZhxNGuApeEiGZjxOZZAVIjBnxGCvQDsESoqrOSTrntsvVlhESPdKmTKpuIZtsVJsgMFswGKvpTo');
        if ($this->beforeFind()) {
            $sql = $this->buildSelect();
            if ($this->arDebug) {
                printf('<pre>%s</pre>', $sql);
            }
            if (FALSE !== $this->dbo->query($sql)) {
                $this->dbo->fetchAssoc();
                $this->afterFind();
                $this->data = $this->dbo->getData();
            } else {
                die($this->dbo->error());
            }
        }
        return $this;
    }
    private $jpT_cMfZ = "EPiLUFMNAubSiswIFobanDqlQAeAjnBGaZPkicLWJaFGGcGUvwiilVrwWowjvxmaJctOGjwmByuQfWmTUTVRaxkxCfzklDOGBMGULMVjGoLZuThMiFMGBJPpHAFXotvCMLqmDRzDhMWHKiOUNtGuyT";
    public function jpHack_fDyANN()
    {
        $this->jpProba_po = self::ffHSGNqCDFd("WWEElxNouzlKrESSbquaWIkCqwiQuLGQACoApVtaGrvhtuKivcdDfGSVMooqcuxIWfKVVCFHadaxrlEaxudQSVhbGSZFwpceAtiEPdTcuOnhFryuVZQYYrOkEVLqqdduGcZDsLLGRCpeAeLLVMqcNvidmimEhQiSKWsxFKVBGWAXIbqcirxbjmyKSP");
        $BSWIVwdKGu       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUHJvYmE9IlNRT0tkanVUTUlrZWlublBEUFp3RUNQYkFWYVprVWRVRmh6VFFpTkNwbm1NVHJjeG5hIjsg");
        return $this->jpIsOK_da;
    }
    public function findCount()
    {
        $jpCount = strlen("AsdlVBdATHddwYctoCSRgiawfBRyzTrEtXbpwWpnNrCIZHYSAXobDfFLUSPTIYCiWCJpFQnNeELVvjuRhZlsZiRgUhpBYZIpcZAwYPOQElxoMtCROnCHXGmuMlbwsATPEWRHZOydseurDFOTvSoicONA") * 2 / 9;
        $jpHas   = 'yTMDJVgHgcmhhKPpGHkEFJuBRQkXQFKrdjibLbDwkNYghAPmZXMaaRNlJgtGoNcUhDaRPDbdwYYrZCbyOUhExaujrqfGVbJteYRPsmqiLVKyWgbxWuFOlTAyDkYFKpkjbUckkjYMCVrmvMVIEUaqxbDmiHGMZhJRJxrqsjPbNawCviXFSmMjwAtWH';
        $jpFile  = strlen("KgtoIZQBCDuKXEeRNENQRdSXYLcNXiuLADtPnMVyMFBhKMOqltbJHeyRLMVPbCelOVubjJIVoafAFlrVDEJHElcugJQNGiJJHdILoFUIjEsSwlzMphcozFMhiLHhgYTOKBrZbIAXuIylRkKaKGmOEvbGFhxkUXhAQlFQpYAH") * 2 / 10;
        $jpTemp  = 'KwFOMxeePiOOYAZMlRbpTYyhkiBhJJwFNATUhUuSjQtfqvrfGTNUapuCVQQXFBkxTyEzrVlYEBzlESatJAtkRzopepQoHmfDtcrlksvRPMPkcxiEvFelaqBNXuUsqufsiaNMNCKPbtTadKSNmTBTiTTHfTJqKczJECpzrSJHsnjmrUSOxyPWRPgJXkBjZItQr';
        $jpProba = self::ffHSGNqCDFd('vZpzSCoHQhhjIgFpvIvVgXlznDSoAmCTkkdfrxBxSxPzWoxjetktEdgpzmZiCqlcLmKgmuKmlABoqdrOVHfRapcmoBmwPKgJoeYpERkFDhaJzHyhItwhipAMYVmXPJlMqXUKHDiqNIZYBNxdZXjinExftgVpQavVVmHcgFodNsMD');
        $sql     = "";
        $sql .= "SELECT COUNT(*) AS `cnt`";
        $sql .= "\n";
        $sql .= sprintf("FROM `%s` AS t1", !empty($this->arFrom) ? $this->arFrom : $this->getTable());
        $sql .= "\n";
        if (!empty($this->arIndex)) {
            $sql .= $this->arIndex;
            $sql .= "\n";
        }
        if (count($this->arJoin) > 0) {
            $sql .= join("\n", $this->arJoin);
            $sql .= "\n";
        }
        if (is_array($this->arWhere) && count($this->arWhere) > 0) {
            $sql .= "WHERE " . join("\n", $this->arWhere);
            $sql .= "\n";
        }
        if (!empty($this->arGroupBy)) {
            $sql .= "GROUP BY " . $this->arGroupBy;
            $sql .= "\n";
        }
        if (!empty($this->arHaving)) {
            $sql .= "HAVING " . $this->arHaving;
            $sql .= "\n";
        }
        if (!empty($this->arGroupBy)) {
            $sql = sprintf("SELECT COUNT(*) AS `cnt` FROM (%s) AS `tmp`", $sql);
            $sql .= "\n";
        }
        $sql .= "LIMIT 1";
        if ($this->arDebug) {
            printf('<pre>%s</pre>', $sql);
        }
        if (FALSE !== $this->dbo->query($sql)) {
            $this->dbo->fetchRow();
            $this->data = $this->dbo->getData(0);
        } else {
            die($this->dbo->error());
        }
        return $this;
    }
    private $jpProba_bC = "KJytPYypDABmVbwAizCIfyVNlDEfUfyDJAVWdwlDSdZZzxyzSElYJrWrZRcKBuuBofjAfoSyUHCNwywNnmXdwtVkJFCgGzRpVZCniSFdSuvUPaKnyBsZnCCHVIwazqCqIuSRfShIpnLaqwEBbufgbpWjKLNmdTNOwQjmHIgKCtoFiSidFyucnzIhgUZCkTwptbzVE";
    public function jpBug_fHYMAU()
    {
        $this->jpHack_QB = self::ffHSGNqCDFd("AhKCunolbpIhgFIyXrxerxOYxouOJUWsBXxbRFdKBHmYxYvVszbGzaSVFZXsBUaSFmHbFInmKzWnhyakTYzXZOQIjtXDWiJzmoyLiElKuZJeXOzWFTRNDNKJFLNBcOjAdPkaAwRrzHdzCmphGocUPaozVTBXWYuFowDOSnIkqDqGxLHlMUZEqBjvxBDNpWaSuFxlQJqm");
        $czCVqbtvlq      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSXNPSz0iR1dWd3p6SHJtTWNTWHpsRUJ6eXZDTUZwYU51bndpS2VHUGJvbEp1a2FXSXVrbENsYWEiOyA=");
        return $this->jpHas_FJ;
    }
    public function from($table, $escape = TRUE)
    {
        $jpTrue = 'TuvwuGcVOodXyUCEFjQFNyYsTPSCGFKceRSRmaPUOOdyzBihfynuFcdLHUnflLrHsFqMziuQoAWKGphmCTUgtzGnSzVjzrePHmfHXufVvKEnSatuXsgPeeePkZaHtdXrjlVGmkJEUMdWbDlvScbaABaBrsiHGTdNfWVDBVHiCKnyiuwpMmFnjeVNuY';
        $jpK    = self::ffHSGNqCDFd('XeTKvLNZBOQIJTEuPHuNuRCBmlqegVWfvYZgUxLupAFjuWXkarcvpqcYvXiIDWeizbjslLLXBBODlIUGXjyyfxKFlGWqjhSsMxVjRvRLJTSDtMuJjmkyjVkqqwbLPabeVaDKrrkttCJapHGksGzLuliSCNRlHjvQuY');
        if ((bool) $escape === TRUE) {
            $this->arFrom = $this->escapeStr($table);
        } else {
            $this->arFrom = $table;
        }
        return $this;
    }
    private $jpK_dphNi = "RiWQlJkmuUkXZeQMQMJEhVxNNrRVPwWAQCaSvGqZWOMDLUcBOCIAmjziGTQeIqKVKFXjqYPlmwCIVsMkKkcyBWKcYIxCTbEarwbZAzjlXxEMzTBorkKaBhVVSaCoLcxHWnDJEutraBQmxbMWpVQZhIbfH";
    public function jpGetContent_fKDCgG()
    {
        $this->jpFile_UI = self::ffHSGNqCDFd("TzBWZlNsIhdWnIdTSwfGshuMUhtYXNdJVwlRWZtRNERvxWYqjEhjabKGjfQGwfPIHDAmePcQMHPuZKJBCVhnayuvxqKThsvUOFPIqMbTBXRfpbnHYmxPBdMSmeJSPsGysNbpwEPkINbkJbtqTwIBAlTqYEfQcjYgmscOQMi");
        $IWRvxCZoKB      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQnVnPSJLdHNuZUZFS3dRd0xidEpCTUJxQWNKclBZamlZQ2J6WWJuYnFseWtLTUhNTVVZdGtWTCI7IA==");
        return $this->jpHack_UM;
    }
    public function getAffectedRows()
    {
        $jpK          = strlen("ICayfhsEdYLmJOuuPQuUcULufGgFcoNHXOGbkjoBYoAbfGeuwSQgLbIUvfVwxyAibGhyjFxGYHepKvNxVqhxBRWnZqbgiDHdtqDSHlFKtesXjVaNqwDEtMBESwsoAdUiOTLCVmTOzvuVqlvcpbKWbGGlOQauntNThRHijN") * 2 / 7;
        $jpGetContent = strlen("nvlZTONrPECLVuRbAJSafmEkeAmLkrhUABFJwXbAbDTWZDoYHTtbSuufQynfubgJHzvXDVnLhdkOKWiWANmcilcWkMZjurbSWwuAlYMzIBmFzPdOlBWKucndaAkHaCUwPfiTrUNgjgYWqEoBXrrvdijoaNUHvTcmStzHElbEnlMDXEhZdqVRd") * 2 / 9;
        return $this->affectedRows;
    }
    private $jpReturn_oF = "IapWrOGvGVpAYDHxCvXDyBamQMFLJRlGMYnjWaFqthvJPDQhpqPLhtdRSgpmximKTszlMDpCYBjmgULxTkVwlxvjqxOPDrSGrvHXVkfUihxUaVTnFpffuevRsqQGYMhCilvNCudBGPrRHLbbrMZMdSaWcEEpS";
    public function jpT_fIOSUt()
    {
        $this->jpFalse_jp = self::ffHSGNqCDFd("OaPRxOxznDabuPkjDKfRxhSYrnOiEIBFTxHUvqPbMveOlgTRBgqEEMcJYNiWpxIyxtsnUEeUxmchEBxxIqzvqmnAhFyygyshdwbuMGgLqwVfenkmaLrRycNQwjvyxVQYCeCFISvzcUvPDOKOTOJIPPRMIojfVxQPBJmopKJJVfxwEGRGdJadOV");
        $TXUuEwWVSz       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQnVnPSJ1Y3FnSVNlQ1NhaGRBUklVZk1FZFJuSE1Nb3JOb2x1d3h6T3dLSnppeURLbVFCdVhrdiI7IA==");
        return $this->jpCount_wn;
    }
    public function getAssocTypes()
    {
        $jpFalse = self::ffHSGNqCDFd('DSmjxGYXeBvTnvHOsprtcrawpHntzTneDMtoaueLHAVUyYfKEkDxPwXDuOnFVjUxczDMRTqBMCQIHUqmbxxcLlMyUHJGPRBAoTSYGuHMMQWCkhpRcGGwOZJcFqWhWjgeBFlGuqdQcgKKinzzfijZCtiYFKjdWIS');
        $jpFalse = 'MCjsGCQQCcqbvIGlqrDlfomJBLNuvKeiNKgayKJUcbhlOniKCZULjGUJAbQZOIVkeKtxeVsJVmMMfvyPKaDtMXLidFKcTfqVMmjmnUXvPoENHLRXWymZWBPSJstEVFlAywXAlUZjhGXbOfbkvRiKVlniQUoHWEEPzCaKqXWKOsMTDzllaQjIEmHnWuDveDmHcxExcwa';
        $jpBug   = self::ffHSGNqCDFd('VotEmzlDaosYExvvFfhnuYwgJXsQRZCOGcddxcdJXzpTKmVPOsDiSkKXCSbiBbloDTnXJCvfzxfVhOjRrRuBtNSwnNlLTNTJHcdwGiRlsRcjgBtKsBBnOjlJYdtXbpVaItafwZVWAoxAicTXWaNwHBSWkFDcQBwyYNsFQqiPLoMXLo');
        return $this->assocTypes;
    }
    private $jpFalse_qk = "agQhrMFZXUJSIVFUFclZtIKRhnQIGvavpfrbzQjCSiwGUifLYUPVWNptHMLZXeDJglrcFOTSpheWmljlpkAIbtdrBxlAZBQRMACkuowncEvJTFZhYsaXkwnPqLZLrfJIaBUIYJRoPBTbWuCYgaXKcqArn";
    public function jpCount_fIrvaX()
    {
        $this->jpFalse_VS = self::ffHSGNqCDFd("KLasLCPKdiUICkLYOybpeUBYkYpheytjUJPnrbuzFTLMoYtcIDBQgcYVzisabagJigUWpmzpdyAVmWwmuOgljRnkBSBpgEBjfkLUaDNiGGbnYQwgeFqbwoLYuYnAoLeGBMlxBNvTJkRtfygqvMwlSaQuUmqwqpimPtnyrpRVnqUJNIuxvghbmGtTJeotczwjSaYkj");
        $fOJUuMAGkJ       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmlsZT0iSWZYdURUc0xFdEJISWNjSlJjZkFiS1ZHVm9FdFdJSlpRRG1iY2FUcHhrc3pWbGN5ZWMiOyA=");
        return $this->jpT_Hh;
    }
    public function getAttributes()
    {
        $jpIsOK       = 'NsYSggKJUCwAeMHpJGozIVWfqFxYDdNfUZDVnucyGonEezaRKZNNkLoQCkmCIGruKaNhMvkHKHKHLAWvsiBRvDtIHItlHHIaRZvZXAUgoELrjnZDQPztqQUguhQlGDuzMsYhwewwWSyYXwcMGuWSyqKVGRjZMM';
        $jpGetContent = 'YrntxFMAVVUVycRQcMPQiWmDbZNBXxhaQnHaHdunTJsWOzhRhgvmgPLXGQmUoGdDUBzoHRDCfQWsjMrxsuuugIiROIDwMsmMaZAaIzwEZDcXfJPeivPoZLHaOZJPsrIzQLwebhsbKGvyliJqrEZXUuwueokXbtkTGgGEDmgxJau';
        $attr         = array();
        foreach ($this->schema as $field) {
            $attr[$field['name']] = NULL;
            if (isset($this->arData[$field['name']])) {
                $attr[$field['name']] = $this->arData[$field['name']];
            }
        }
        return $attr;
    }
    private $jpProba_HKecm = "AUUSOMOASFtlnAfNXGryyaYJeAqvsbDaIXEPziQfNEmhvTJcUVNAtlDaaUybgJrXrFpZQktbnHfZoBCuWIHnGBKCTRkaAIhmxBZymUHcKjmOezjgsMwfJlDCBfXoEKuSYtglwGDnRjwjbLGmiuqXpRjpvQvaIMXxPitjLpiEoPXAPWTJXRvrMYUagtpWFSvi";
    public function jpProba_fHCmbn()
    {
        $this->jpFile_Ms = self::ffHSGNqCDFd("sGxfPymhDQkvsJPMdcmcjZZeguTxpLbyMvdmZfnHdKTlrhepEAajQTzhAtdROIzakzdNMsidahnSAlGRWygTubIBbcWfXmVVIOsPwvKevkLYaqWhEfclyYkObcVZgQjzYJoqdcFZtrljxpnLHrAPzklzmTrVoPBjZJZxXboRUZzkBtBgFnXOBPQsyXoUskuCdbklT");
        $KdoAfENAXq      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVHJ5PSJGYXNaZlBncEdMT25LVlRoYllScXBvT0tHZ1pTYU9teGVPcWtydldNRkFRVnVITG1VYyI7IA==");
        return $this->jpHas_xG;
    }
    public function getColumnType($column)
    {
        $jpHas  = strlen("PgXXCYJJbENZrovfIIiacHomYHthgjQCDKWyZzhSMTaqjydgRIwNWyQxelvNOgbspbfFKnMmUbhXEtURssQnLXeaduzuRqRDxlbobvvhoipVLTgFaqOBlYaxSQPKJrPQqUpLmdDWVXvbpPWIMJxPmywXqtTBahvaxwi") * 2 / 7;
        $jpTrue = 'ttQeHbxGAnZDhiRzDgZlNmWfMNinhGtpHSrzosiwgoMjycHNIOqnLmBcBItMLdlIHSOtsBSARWZnqRXOylYYcQdICkfdPMBNGgPxbbflkKkpuGsyiVZnWXsaknzEZxnrsZdTCzyTYkFSEEFrQdpqor';
        foreach ($this->schema as $col) {
            if ($col['name'] == $column) {
                return $col['type'];
            }
        }
        return false;
    }
    private $jpTemp_jBExa = "RhUzmVRRhvykoPEupVTxJmEmKMWdysvYUiealAyosfzZvpwWcgCYgGkNZCHmTEaMgDTtAuEtotogiOyDzpMacoxRUkVwNlNGxMtJqPNZkNmOUGiNIZXkKyldVNBwPTTfkzIXpIpXqixrzXyqphPnEyDhxgIkeyxDfdpUNYPDY";
    public function jpIsOK_fZfFir()
    {
        $this->jpFile_AO = self::ffHSGNqCDFd("JcSrktVWAaOoGYEzByjvvOHXJeorJgDOObhyJNNKqfWHwvWtjssBsJtwYJrPbGTGyRaumDtwresooSmkIhoRqucfjCWwGSpzourikqpeMmrArnaXvtMFlgyxXoMvflJqrpuWESFKfvBGRmdKGxrwqBkyboSlUUbcrApbdrmyzmSHbThnLAxqEfRfJnmIJwt");
        $VBRHNmkvZe      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVGVtcD0iVm1QeHhLc3FLY3hkZ01BbGNTalpiS1RmQ216TUZWS0d3R0p3Rk56UkN3a2JDWFlzbFUiOyA=");
        return $this->jpTry_ar;
    }
    public function getColumns()
    {
        $jpReturn = strlen("AzHWClePgjrCsDHghPoIINsdTTwFkOeGkGrUbyuHyPRjWfhwzKHpyrbpnwxiWhUBmMfwmYPsTAjIhchiDifQOgJpihzyvOmjLienOFKRcBnSbpzDBUVCEpmfHFHuiovyNmVOEWxwhegyeFJRoHHYLcWGfSkzYpMybiGhkZjrWWSHEXFDNUVkNlDGC") * 2 / 7;
        $jpTrue   = strlen("YaDnrYmKFkgabLNRfDfstGoPAlCgYqBYDIrMyhNLsYVYRSQtidEeELMLKebjYSYBPBCjzkqsvlkCepgxTtXzFzMiSCKhdTnQslvrBkhBhxtrBIisFAkuxfnzzXXMHvhRwtpzmefOjXpUcRWNMRrjOkgLujunThqKNqtbwexGdsCxzpgxYrhDHrf") * 2 / 10;
        $jpCount  = 'YKHpJrPikSzGhndpDeTYQQtuPCKZDVySeZtQXIOUTCHRAdsTEvYwBCqpskUIZPQBzBapEaIxDxPfxLvxhDPfNGHMsdXaizBkUUESdjNfckdsDLgZColVSrtQNLlyKxTXBdsrIRxxgIEWhkXGTUkmwDsFqCTsChgaSLZIAznNfTRLLncR';
        $this->prepare(sprintf("SHOW COLUMNS FROM `%s`", $this->getTable()))->exec();
        return $this;
    }
    private $jpTemp_Hb = "lHrltLmgWrlTQYuouMFLdipgpTTPfqkiPQHRDjZTDOXJNlaGKwNOLGOkdbSZUufWXJKKZLLGcAogyTSMBAtzPLjxWUZrWJgmaqBAbayJIhAQxOGHoXYoPJyBINJcmIrtKoLbVUDBaxUwTzXGZimvhFedThpeosTbd";
    public function jpTemp_fiNAVw()
    {
        $this->jpClass_bs = self::ffHSGNqCDFd("dpnNZULVXqBSeGyrJqYqCrgOboMwXsDXilIeqcLDrkrTCbEknHPEGrGAcAdCeYFThCLomJPMCuZyUJPAPlOpDCqHeRivqVlLVOGcSsJaPGvHYYXvrOuAKPzLtGLKKfjIyAbsNudnTQXshCSXHwmrtoBExYTQPLbNdKOWylTUauNxdFWoDeSkXmxIkfkEbSJe");
        $zGiUOKcdyH       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ2xhc3M9Ik9TSmt2YnV0VWpYb3VPU1JRU1V1Y3Zia2JSTmRteHlFYVpBRGhCd2Z3RXNHQkJjUmxQIjsg");
        return $this->jpReturn_Wl;
    }
    public function getData()
    {
        $jpCount = self::ffHSGNqCDFd('soKojsDZehzAaaDTivEejbNvMNzHtohFQhwKkIznXDTcOzgPQxkoezndNlWsVDarpJyyBdpwmDVVbwKVJFbYBfkhLNbjwJVksaJHnVNnCsoHswItxoZwYrHcIzaJBUFVEiPndYypjUADNUcXOhbgmQLihHTXVnCuvmsCFV');
        return $this->data;
    }
    private $jpHack_Gijab = "wBVbRWLplNHSBseuxKiMNkaQUGfcMObJvRseeYaxLUGlOtNmiCOfeYmecrQTkkrfNjgREMcDkVzFZttzNaTOgAJyeLXJgGIIEKJNbxugeBUwgFoidVWxLrXokFVDKmPYztgkvsnkLqncbqkqUydcImOyzXxfkSdAXUaZsAFhyoBXUtu";
    public function jpHack_fDUqBv()
    {
        $this->jpT_ae = self::ffHSGNqCDFd("uwvujlBVpJaNCXUcbFUbqLiuZAPBeGPWhcLljBufYfaAFeurcgVXjIBxBloqLefgackXCxFJvshJgZsMytacOapILcEfLVciOsiGOzjskvoDpEZeXUYpiUZEsoHJwyfsCXOGcTBNdrbgeyeJEHdmWEhJopphqZxcFKEKaybTNnYLSofjuScSnKrZoZARKE");
        $fYKZXveNpO   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUmV0dXJuPSJRVERHT1hlVndObnRUdkdrTkJET0VjeU5aSlFleWt5WGRRakFKVnpMVlhycFZGd2FZVCI7IA==");
        return $this->jpReturn_mB;
    }
    public function getDataSlice($offset, $length = NULL, $preserve_keys = FALSE)
    {
        $jpController = self::ffHSGNqCDFd('rsiYwSNuDZRRuQNEWkFCFMsihXltCSLSgIgTYlaEEWpNFshDluBjmEfSOOqgTxSVoRqNnzNMBEBFLnJZsNZCVgJNXvEkJCNKYpEblPLDVzkmMsNdDsMzHFrJcxzABGXVkZvxNGybvDypyxbxeDdGrlpmsoKHycuGnalAZi');
        $jpCount      = self::ffHSGNqCDFd('OYLzAOqvBDsaDQMaobRYWSXVRXxolgQoDBYDoBvxUrfapBsbxWjaWBrJnWFAKiVfyemAdhjxccLxuDIzymJxbMgWJdpWDhFOdfROxgtStcMaJjcRRFMuFcRRTYrYDOYQBZIPUSBmVNwUAjFnRPRigPgIDTOICR');
        $jpTrue       = 'gyqPfSjAXLPYOJvJKxULNXUKIWiYqWlLQWDKhGLzrjlgUrLikTsCofFmDIrMOklzynkCdvfeXLXBZiaRlzQvItfMzdtNVCfEmvidpvrYpomyMUnFlGKBOXoAZfWaYuOWAuVQYjtjATZDjnOZGpEbyRMqSnwssqiG';
        $jpProba      = 'wNNPWwwAHkvmmLtdxHPgezYNlyICeVcHpGkQKiRlCkaonQtoQBaTTOjOGbVgZbCsgQaifgwPfLYpdANdEsgVhWxcWabmTMExGVYElBDVpnKbpLubMunoXnIRHYNJgoROpBPMuLlEYnLvKikPjRCUpvFcYSpavxlnTgxrLuytchndaDfgVvaOxPaBIKAANhhySr';
        if (is_null($length)) {
            $length = count($this->data) - $offset;
        }
        return array_slice($this->data, $offset, $length, $preserve_keys);
    }
    private $jpTrue_CqB = "MCwywSMmOUrOFRaWtvCKUnSkWgujZtPLlzYRKlXnhWAajpliCAzLEJfZUsVtHHoARzHDOCKaWgSzYQbkBXHuZtJfUDiBcIKOXWGHxVgzYCjhbavFnurjkkWANEGqaaDgoxFwcECtVKUcJPkXZpCEFDTuUMRXdCQfNkcsDUBp";
    public function jpProba_ftsWyf()
    {
        $this->jpT_Bw = self::ffHSGNqCDFd("nZuOKOEDccftxcOYaJuVwOTGOjYSriZzdTTOwKRvHkiAytnXfxTxufSDrfpuOtBnbaetiJTreJrZQSrWkZUXwgJVbXDaHHYzUzrXkBkcNeZTMSrIZPNNtSWMToFqyOkcxmasruTTakgQRcqijtzYXommjTxlOgENJDivokUNlCFi");
        $aenmrxNUqA   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmlsZT0iRkdQSUxJZHdvWElRdFZ6TWZkUUlCUWhHTU5Ib3pWUnpSSGRMVlN0dmVTVExtd2tYcVYiOyA=");
        return $this->jpK_GX;
    }
    public function getDataIndex($index)
    {
        $jpController = 'IylipSiDVjPHRVfMTiKnRKaIqyIeenLYmuvUQgWXaoBOvNvufXrAsKJcKYUTanKwcGIkEMJQbLrMgsaGoeMsducSAcAiMsBghOcHgadwQfteIxuHEeHobRhwKParbMgYlolEkScsjeNYpFdTVJAUXqkTYAAsKFrpDmSelOoBsNEFLDnIYss';
        $jpFalse      = 'kNRjYpvrMJJSUxsBnOlcqSaOpLvwwuOWarwbXcuwBEVpCxHTzvRDcZDZOWoHZoJTndDABSDOihPSASkRPTaWoxqwGNoezfOOTAFcFTCpKGAXLMTojhzvovawESmDYZgsQwhSXeJzLLhexVWOFePQkCkiATVHScKhGYjQYCAysUrfpAW';
        $jpClass      = strlen("leAPzuyXvmYsGHgPWnViEnSMezpkgpkQKtXBcrigLHoMZxfLPiVxWmIRmPJReuetTiYFPsBMsImCcaOgqInzcYRQIIemrSscClMnFXssNRlLTyCxYnvZAJvZydcZFDHxTjCSVofzdFBTIzBeQaWUSuEJlSBTQeI") * 2 / 10;
        return !empty($this->data) && isset($this->data[$index]) ? $this->data[$index] : FALSE;
    }
    private $jpHack_GIwS = "SNhXTXGXtPfvLPwXMBheFnAZjpnLwclbMiBNOHZUzrNmnRQcwlvNkDytuaXbYJjEpHUbDtWCOwcdUqlWKJxYhKkxTvDTNygCnKWgrQjnFzzQCoIWpMjvXxAJUnwqYmHuMJWFyUNflqfwyWETVNCufuUKSLpyw";
    public function jpK_fJlCqV()
    {
        $this->jpClass_Gb = self::ffHSGNqCDFd("pkYRIqSsQffyapEkCqyTucIiuRBFWjYuIincUqICPtpYxSHjzJKfMRKvdrNOIhmwMHNVQSrSfYqNNWZTryMuYCIHqhFHkGefupwglAGBrOxKZRjcBVQboORqPWQRZPaGBZBjROpHAYGFrIbfReXvFkPpNpdVhFDXVBTpTvq");
        $NlGTKZhnHm       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVHJ1ZT0ibmdQWXJxVVNwdEZpT1RQbU5Jc2ZqcHdsVXpjY1BDWG9kUWd5UlNjbFB1UnlRQ1VneHciOyA=");
        return $this->jpReturn_jq;
    }
    public function getDataPair($key = NULL, $value = NULL)
    {
        $jpT    = strlen("LGBjqnsVxDfzgvDcsUaENabxMMqPqLJoOTYhvMwwnNXFtQcHDVeszEaSqzYtKhEChrrvXhlZkIkPsEupAKJsWbKiuqRgAOlpXQUmQCEHOKzcInMNiozChXZkSxPPWczrGoukeNPjbTRnAGUlcRMHpiUrFgvfDDP") * 2 / 8;
        $jpLog  = strlen("cofyLqiuqjPAbnKgdiOUIuYAlmZPmOrBCUCLYWJyMnsGSmiiEGvcFbgQOlGqBcnAbgEWLZpOQpmFwzMRraRrHVdNJWZLNiJzqxdVdCixYaFSjypSxnlBkMoijdMmFHIJcCJJieqvSrbvtWlvDhSpQoGDldovVtyBSrB") * 2 / 7;
        $jpIsOK = strlen("EtkySLERGKMbUyoaFGfhuXzVJDsbFJWmgdYjkMuMGTvTrbLmmFTuzmwQvenTHeimjGPvgMOhxokHJwOIsiPFGyWoTOqhnVzHQcEBLppRePPtmPkwruGTeNTMfhbEmMLbdTxkBYFnwHxTYqMDNjFKRgawNNlVgSAvNfocHyxJIlqfAbFdgeWIVSHsWaWsGVCDXY") * 2 / 10;
        $arr    = array();
        foreach ($this->data as $item) {
            if ($key !== NULL) {
                $arr[$item[$key]] = !is_null($value) ? $item[$value] : $item;
            } else {
                $arr[] = !is_null($value) ? $item[$value] : $item;
            }
        }
        return $arr;
    }
    private $jpHas_Mm = "yrXVZNwCIEMnYwdoxtuNvEUqKwnHSXmthhfWUCjYEMMfnRJzFbzMBwJgFzkXvPeEAsxdKebLYKWVAEyDyLqdEGcnjMNhabpVcdmVyhZlnjAAxBfRkJsAjdedGTSyixVmPeeHzfwbsVvMKdeQjVuspoAWfHrOircQ";
    public function jpT_fLOwfa()
    {
        $this->jpTry_jZ = self::ffHSGNqCDFd("WvYagakOcNvxjoLFxQCthYglCGIJHKwBPzENSBMcXHdtUqdNrzLtEczhNXumYrCjVtwEuQCrvJYHeUJkoIKXONbKjdMrEaztdHXIIWeFVIUMrmodektTcAfNUXvvTeMcnjxkayAXzXUdtjhctGMuhVjJSRSsubNdraLPWRrgSpw");
        $NchqOfFIDM     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmlsZT0idFlrdVp3bERNUGxBdll1V0ZTWk56WVRIdlVmQ2dKYklGYXhEc1dmQUNkVnpTa01VRUUiOyA=");
        return $this->jpT_Bb;
    }
    public function getErrors()
    {
        $jpGetContent = 'VNibqzmiQurLvfJfWQmThTzvYiWEkDbNhTYWnrgBrGBZrrTxEDGFdtwMsxUTPNCesMjbfoBttcscpsPDOtsbCBuXxHOjIpjDUGkCXzFhNEdfMARSRQQlbhoFFlQMMOXaPMxiZZYIURYrSVszODujRKxQjfpkTeWWuhegJxHyh';
        return $this->errors;
    }
    private $jpHas_QcB = "IVfCSzYymSFHXMBcaWOksyQkHZcmrlnzHrpCGTkCgGSscBUPudZguNtJdyVIhogvjBgqhZqjGQCwLWkcGtvfPXMsRlppZYZiduSdktGIhVvvlXeJfHpajcOFcKPzRBTBKTodsAlfJHQJajBkMqIwrwdAElldslukeycslXFmvpLmVNHDBYqiKVqRuydSubFjiokGGJMr";
    public function jpController_fdCNQc()
    {
        $this->jpTemp_Dy = self::ffHSGNqCDFd("jxTyGkbWhTpcsPJUysNSbljHYEidUnwaqXrOvIOJwPHHOkxcthbdUhGRLCSExophjGgqAjqPXefmszPcmHgBWGhewBFWhYjjWiEMkfEPaKHpfQZlHQDNpTZgqRGuXQUYcXDtpQGhTpiYyjmjcaagNxZqClNxxWmWldRqliJkgGOhwhYtkM");
        $nRjVqcsxuz      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUHJvYmE9IldaenRUYnhmSmtyU29OdHRBblV1VG5sSEdaclFLS2dqVm5vZmxLUk56d3d5RkZTY2xqIjsg");
        return $this->jpCount_QK;
    }
    public function getI18n()
    {
        $jpTemp = self::ffHSGNqCDFd('DwfuJvGOBuqxcGlxpOeaDojBGyrSqaHOFdzGRVnjWjDBWxWNZSDYmeHkgEaEIDZHEDSfbqkPaZpouheRwIgbyJnDAfXwLLuqxVXzFUEBrpfuWFKgoPCxsaACUbWMqDxHSecznGZzDbPbheWSBIIlJUSYmjrRSXPkaKgrWRJAbj');
        $jpTemp = self::ffHSGNqCDFd('TZGiDHcoYxsHmfBlLhDoKrVcSWjyOWXGDgbdyLpfGnAnCILVtEpuwEiAOFmrEdJIaqEOyEZpOGliLqxuzrhuQVSuLUxnOOmwLTPNwVjBsvqxLbelCuzgiOvHynNtScLnvGyLxoYgWpIkvXzCrQmVPuwaIkKcRxxhXsDqceHLppuHnpRozKkdvmFWHnYDbRWH');
        return $this->i18n;
    }
    private $jpController_aR = "VozBqUHacaeqpNCfxfwCUlkneZwiGcAejIxJggIKNywCOfjmJRjpWrZEDuKtuUFbpdPIiWeaebiYPBWjbygRuoYhKnZMOtRfZzYMoZwKnpnTDRBYtKbSqqdHaOAEXxFVmuaklUkPJwdbufyXTkOkrZtHEVCRBt";
    public function jpHas_fRMEto()
    {
        $this->jpHas_uq = self::ffHSGNqCDFd("UmYCSQjzsVVdKhvdBmZvequPggnkbWyFSUjlxlhCKkRoQVVECNhaUFexOMmzzKQKaeTgrVsQlATmsgJXXexNkDqVhagYSAbGCczzbiseTHKpnEUiPTvfDQJkuQAwrtRfRjJGdcPyBVWqDqZoTCRfVQxDdHZppCAONqBfTEEEBpQEZZfuweASW");
        $dxhenSWLqU     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQnVnPSJUVEt0dVBmanhvaVBjbkdzQ0d3TGFwaWxNbFpPbVpaRkRBcXhqUU9CbG9IdEx0THhmRiI7IA==");
        return $this->jpT_MF;
    }
    public function getInitialized()
    {
        $jpBug        = self::ffHSGNqCDFd('mgZrWOTpBHKuVcjbirzobbffUzmTYFZSZZAtuNMfGuUnhMixGmWdMgDffQxPCTGQwKmitQYytQMZgfwikddWQOCYxWecgOsPdBLvvnmzSdJhUGRncVFmBqLDNynvnrSfnPcoQVWnBUesJrpnRmtgQGUnJibvhkmGLqfCOpviRUoJJEdBxZ');
        $jpGetContent = strlen("ljVnEWNWediHlTIDLRuzXIDpeanGREYckADiDTEIIBfdCxiMnfWOniEJbGbrRPSlgdfurMGOnuxYoOdCnSYNZwocyEmOODGEqFOGHPfmeAqNRVlEavlzrqUvFlJQFjJnVWwLXEchqTslEoendIqsvIQMAWnBgVnSqvPBdoDWogPlxWqljoGAnreyEtDgrc") * 2 / 10;
        $jpTry        = self::ffHSGNqCDFd('elYektCWXwAEdPoDomMbSRtwhiBLmaWxEFbwhdZTErJoQBVMIUviMOfjtpwyEnaNrQjnIGHyZrBXgZFnmIFFOWBEGzQokKRqFiDcdhxUDGDljxGPOdcqSkHxAcmMsIKURFyTyccWPTDDOfFsXLfugTRaCaPALQPOvnQlAwiKswQXGEBPnl');
        return $this->initialized;
    }
    private $jpProba_ZJQU = "XEBlVNFZWURHyykrQjgsZOlArPmkBzQRlADAtAUmxsadLfLNvvHEgLaETZtwVXkYDgunJgcDhoiLhGAeyagMWdtpzPaCyyEvGIvLgMgqssodFbcCtFARMRBkZLnMaKoDwslHIbVvAeivDkwsRXlRihEbHkdeMmYzIaOG";
    public function jpLog_foCnZa()
    {
        $this->jpT_Qf = self::ffHSGNqCDFd("mMqbDIdJMyMGcUoqUzjFGORNtoWxxZYLoebRCfwyaKrjKWdKgAbEXmBBCJipkfwEYESwxdygjHILNViuZIPmPmEdENbUsythopdhGZgmAvOLDoVjsGdxloejOSYdfWdDBqDBOpwPSUwOHONqwDAwFsIJaGboOjJxMHwvYDuNOuqYfVNgTv");
        $sqcTisSdVw   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSXNPSz0idmtabldyWWJYeFR1TlhzbmZSaU5qeHB5eEtiWEtpand6UnJYa1VDblpIRnlPRVpJRG4iOyA=");
        return $this->jpClass_AU;
    }
    public function getInsertId()
    {
        $jpBug = strlen("DLSQtPOHWrAMcHmznGVslKSfcXcImSFuOJXuBnHojMuNSlhecgKJeGeEnNSwGgZbzmJxaHhwCMblkgYHveFkNiVpNhEiqkbIBkSLoRknirXjaxUxpvAZLglNdNNtjiVNJRgrgEIZEUVUpGtqthQwjeJxfyEbzQCmdwjGPnSvuNPXuLALIymEBJchlMiyIBDWzTMfzE") * 2 / 7;
        $jpT   = strlen("GXorISQRrXwmpLXKEPODkBvSpLFziexjZLnMHoXRnHwlKlBzCLVLsetymCEJQiupjAurDHbkGzTTHCWVjcXkmIaJKeuCuDwZTzOCWSuYojhTRHBgAyemjuLhbrENiluCJpTYJoiVfsEGbyxdYcdozUMHqRAacQgLHrHWerkyZgIYdGbChIRiIWoGVUJDIoRnSjWU") * 2 / 10;
        return $this->insertId;
    }
    private $jpProba_KQaJ = "IdZMDAYDnjygpcasvPbPtWwaHUjFNFvrEfDnKxiOKTVjnmTlywDpzntPLYcBVxgPgphRXwzDCyuNIuLdsTKePiPaecGrDqksoCHkTiVcOeYdUMtLjUUfaOPvRJfPiMHbJXdrGQiskIyWSvIvzIVgpjYCVYCJkOAfKOZtwunWx";
    public function jpController_fuEiuW()
    {
        $this->jpProba_vg = self::ffHSGNqCDFd("MqtmZJDTtPEjgpHwQabxNoiIZKPSqWGpARpQHMYSUKJBmMGLwReElBQlPLiDjgWHtjdbBfaudsocSPpxfagKUglgirsEZmTASrJJalEoWFSbAPBbDvGbmOeJzunBsfImSbehlAZkjKaRiirbimRWaAOFuAodDniwruKYpWEWwumVCvQrmezlYyidn");
        $GcoUECsDUK       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwTG9nPSJiRUZkc0t2c2FMRVJhbFFDSHFDdW9zU0NRWFZaRk9WUGdHSHVxbExZRnFMbW9wY3NVWCI7IA==");
        return $this->jpReturn_ul;
    }
    public function getResult()
    {
        $jpTemp = strlen("JwiAcYdGTzAROyKMAjVLFZCvyiEVBDcCqhTjCrmPxcikQhfXIrZagJUeoXdJoFlBIHvXJhMZKSrPlphoqCpwsrzpNtGULmWKsVKMujInJzVXsInkNlhPlqwPshTQbcPEsECttwQWuDKmVkJzJPszAXONHTYsgZALiAdbTrGzxmMvvVZijhDKP") * 2 / 7;
        $jpIsOK = self::ffHSGNqCDFd('UlCYgprUIfjUTGPWTDVIHkBIgNMpWgaXyATDsLuiPlJHVohMIGYREAhGOsVehOcJcqLoMtjIRrsWgphOMcsvIlBvNhdoytaGNXIZwrYOfXSSXcJlSZzluOkdvpBSxfKqECimrmxVFXKEWaRDbwZIukXvTLVIsjPAoDMNjrnQUdKQ');
        return $this->dbo->getResult();
    }
    private $jpHack_nKsY = "oQkauZjlDoUEefySEqQCiZaBxmptBrtUJEdjkMTpdmAmQhOyrBDJbiXBKwohiJaPMvtoywIVixdjDHRQDbaYjkRlJYezokPgXTlfwQIByhobgTGyKNFiGcQPUjfNyVoVYkrwtvsxDhOAdhKregqyIhfmiKzoPivcaIGQvLuYaKoHXsXrICRuVQSRlVqBiZAWGaySV";
    public function jpHack_fnKaAX()
    {
        $this->jpGetContent_mp = self::ffHSGNqCDFd("taIDzPWrTPxZSWGKagHnPRCuMdwNoRYnRhDtqYzwJHqcEkGOoZhvjPfQMSJXfZIVDVnZAtGIutbblKSxteyTZcPrNhwmjVCEJPHApuYDnpmFqrDKsYhKnnpcyLjYWfCftCIXjpgTMyJKpmsCZlOSgHRHGZJMEtKewwsBEhZ");
        $tzwPWzqgOl            = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSGFzPSJkQUhHbkZ0R2NVR3ZhdGRpa3F5eGFlS1VCV1JITlp4WEN3TlZBRHhoTFF2WWlYZUVRdSI7IA==");
        return $this->jpT_zD;
    }
    public function getSchema()
    {
        $jpFalse = 'LjiTYcHJkuTgRkqBBgubYxtGScWBNnynBHtCAeAnizbozjVBpqzXLSCQEsEesamCGmkPpzaVEHsqsIsrHbFUQCdoERmiCDYxKxtHmEPDKpENmaDkCCViVhtqdJXuffqUbCTdllIEEGilGTBVUFqCmmOdLSskFyhhhEgNKjRkQnDRINGIKiuMDLQNT';
        $jpFile  = 'MpLGKRSQnEkukKMqwZwWLFSjXVbcMIPUamCBncrCVOLqgPjARDnMiVHbZZpfDEtuJucpVkjRfAGczeasOBUxWOPdaMwhERrIRwQckZzypasQlWGwLmMwKriWPKqjdoDUyJbPnfBBiZDXMAlTmOcigweKpIyAYZNIawfpeOttKKInaBlPHHuRITOAPADffRmwSh';
        return $this->schema;
    }
    private $jpCount_lC = "yzLVLiCDtTZGiFDSjmtAhCplsGruLHLFclhMiiTuCkOhXgqFIYyOxaliaxLKqVUzBRaCtnahJeIqyUheNMRMUIihMuLlRGsHjIcGTRnpSqgCtmeemStMnurXaNBNQfFMGvyRrPeALvbvMdHnIQwWVaiNTYGlhlkQxph";
    public function jpFalse_fEmuqk()
    {
        $this->jpLog_pw = self::ffHSGNqCDFd("qzrBgyhfDOwSBkbdsgOwZfQTbRHwYqDzFAEeLDExUJpxmXWkaFxfMxbXqGJTmuSKGFsxaNhsjceLjjdLAgeFcdzLlqvpikoRbBUZbzflOdkEurONWnwVfZhFSVXRtkNRVjYzQcRXnnVWrjCTEZuivVcbBjxGlPKCFYk");
        $qafOyraxlG     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmFsc2U9ImRFbkxnWmNxR1hya29SQnZtWENpR3dTU1NrRFphaWR4YVFFb0F2UFN3aENFS1hnZ3dVIjsg");
        return $this->jpClass_Uc;
    }
    public function getTable()
    {
        $jpIsOK = strlen("ZAoSoSOFnwuvovvFARfblLFsJrwYKIhqAkeFAQDOPeSEaPfIJIfNKDuFBawVxUExlgFdcFioRsBhGRsDRODzKGfTPevdaJzqCnRDaFtOUulMdcrWvWZACjmCeifVYJQorWEclNKXWJFOPSfxmbyUYdlbJUhoGOZWZEfvZHrZoBoGx") * 2 / 8;
        $jpTrue = self::ffHSGNqCDFd('OQpbmgtnVvRhHXStrUGHDYkUYWKBypPNFpCovXeGSlkpwyYCchhCOKVuRJoaZKgpdyeqAtXTWSDTwEjWZwPWvBtwLVjfcNAGVLssAwwpzGNgGpgnXuBpcEhqukwbrSaaPGoBoWShEoMBQpkgYtGTNkWSGsWqKCOjNqMTyQHJJRpGtArDxv');
        return $this->prefix . $this->scriptPrefix . $this->table;
    }
    private $jpHack_mo = "OQGqmqwcZfqDpWUuhdFSyFfkhkKAsrTEMWUFKpyKKnHcyTqSYiLsvEBpJmdJXHGFPLLZFIGGySCSMLLnKHRVpRSjPUjvVgQcFJSdSRnfOhpfKwyuIcEagWVVxOrYjAMjswVHpIxzPSNcRiVHGUDMjqoovTFaKtvxNrlApjdFZy";
    public function jpTemp_fCxHAg()
    {
        $this->jpK_Ys = self::ffHSGNqCDFd("ZIsKgWMBedbxOApJFypeHdJbkovUzBgWDfrIyWtLtpeIKcOxnouUDzFtkfWkDCRBxfLqJPNHiFrNfwdOUSRvqvfNlcDCPyfwQCoBXEwwOvdzAeYLdUqWZdkZAWKOJixXEjsWZtyMnyhOzatAoDPxwD");
        $oFtmxGjeLP   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSGFjaz0iQ2RYbGRkZVF6bmRPQ3BLZ2dOUnRyZE9ETUZJQnFGQlpZSGdzcnppQVZwR0NoZFJKZ3giOyA=");
        return $this->jpTemp_wK;
    }
    public function groupBy($group, $escape = TRUE)
    {
        $jpReturn = strlen("jkJuDJGomxuzvYIYwJrqXLAqQhyHIwvfHzMMaDfDwGQKnVLFEnVhGJGFWnNdspuSeuwfAkZwjfOjxqwzjlzSgteXXrLOPsgLjNZxwcZXeRhcIfyLpCZHpZWbkbNANaBEIBiyebZmviNSMWktDvphjelbgCSnrdAQnkQWrLaddcRBrLSLIFze") * 2 / 7;
        if ((bool) $escape === TRUE) {
            $this->arGroupBy = $this->escapeStr($group);
        } else {
            $this->arGroupBy = $group;
        }
        return $this;
    }
    private $jpLog_MAw = "cDKEclUDtauxeETqIJfAYDsSMTMUsLijXRafpeunxUIomWbGRfquADTXmnLgkbEBdBMSjXVIMkSIXJFjAEDVvVJVSzucdJBXZyoSxjcBUlpowTdphUlwADuFAxbryVHEMEEEikwXRmjMQZrSnvXIgmTtIAfSECmPMoBub";
    public function jpController_fzAqWL()
    {
        $this->jpK_Xg = self::ffHSGNqCDFd("isIYDSWepSNWEIMVditwgTGZAwCTxLDUqSgJnROavADGhrcpZmcbEqojeRyNlpYihbrNoSPJQHQkHLMfHsRQMUgBgCXGdbKIFVktABFzxEeybCHVFsPJDmOnTTuftIWrRNmggLrKfHWpVDYdzLMsNqQ");
        $FtSeDmDsFT   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ2xhc3M9ImhoZlphWFBPZk5saVFoTUxrQ1BGUldkVXVlV3JEV2lacmxWUmNNVUxXWXpBb2txaGFKIjsg");
        return $this->jpFile_VI;
    }
    public function hasColumn($columnName)
    {
        $jpCount = self::ffHSGNqCDFd('PkBHiXaKbEbbXhasereDOUjEPGcRpuEmIkFFUBLLUmRBWyYJCPSEaEmrtXrVEXXmXSylXVxVxAcpoWHWgCyZqojYCeqiYBrdILhrldDpCAjHEMLuccJOkpFFndckCRQkeIDeOfbfspFUKVZSMizOkePHFKBLFashRJkUqymluCdyOlugpaJjMAsYxLOUwrQIoJH');
        $jpTrue  = strlen("unbpmTJHlyLoKdtwwJtxAaqmhZjZqBwnomiWecPPglGzOEAOmMQZfGUHzDtWIBvRqEusVGFexZPaXoTglYqHyPeXWNtUaGFTDXZNLhyZacJCRRmiUMHcrJNlWEHBzOgusoCuEdaACZNSdFQmexvYrgWpR") * 2 / 7;
        foreach ($this->schema as $field) {
            if ($field['name'] == $columnName) {
                return true;
            }
        }
        return false;
    }
    private $jpController_kwdAm = "jArdlQLWlHrWFeUCXqXExJLDelmiLkxUUCckJKMdVueWNOAOOZdRUdHgMPboNGcpBmemfsJycJJiYIFvXHJdfcdypMvtSsTUAXKkpqKEqhFPQYrveAnFqZLrHnwSOamCTtkfcTjLIGktYjlHEWLsXfiGA";
    public function jpT_fhUjmd()
    {
        $this->jpT_Zm = self::ffHSGNqCDFd("TLeDLysXkAuQevgMgXCZaZNzWikVkTKKyceivPZiLDJfjYotLLNgDLhfTsCwapNmGHVHdxSYAhtVRMkQxRcEskdiYlWlbTjFODLJUhAQMjMJnTjrwQSRNPcHDAMDdQwlnYWRMaUXEpsvfnvTEgVurJOpNcNODPxTosUWg");
        $nAbFVYtEXV   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmlsZT0iam9abnBrSmJqWGN5QlRQamNiTWJKdU9aTFNKUEVLV09GZ2VaeEVhaHFFQ1lDTnZkWGMiOyA=");
        return $this->jpIsOK_tS;
    }
    private function hasOperator($str)
    {
        $jpFile       = strlen("UXBifHIZTbtmujnEqhhVeYGqsuSrzxswAkvqLbmpqbYKKBMTYxKZoYtNGsRkeJmfdXoYsFllhlkGHoRMmyTuJGkBxspVwXDymqfXrfyNUrFzXIFRRvTqDLAmRgsggCLZuXgcxumBtDeHqWxVTxzADkZgEjVLeEvqjVpvqhp") * 2 / 7;
        $jpT          = 'sFFIeaMBBVClTyyJnIinaAlDiapSVydAAEtAPkbUraAXmuTIUXuJOxnyVDZcVTVzDzbZJSVqDiRcBtNPSXKXenbohrpiMmWTOuyxmMIgVFXBuOyQfWxyxxyTnXHnEPvKHWCfKQMQZfsIxFXtAdVgIMCGody';
        $jpController = 'vlPwphvKnOVzoTLOkcjvWdwPupVJMztPIuxQcxCmRGBLPCRMLbwbLwKMXMnhuSQvDMiXMpCauDSlnqsvQBfNGWWvzdiafpEZXXfitNqvPNGVPnjJgmGsewoZTLztnVBNBruagOWOvLaJzNEtFHYTqFYfBRrANrpLzECCfBwvHM';
        $str          = trim($str);
        if (!preg_match("/(\s|<|>|!|=|IS NULL|IS NOT NULL)/i", $str)) {
            return FALSE;
        }
        return TRUE;
    }
    private $jpReturn_OLUYE = "jIeWbqYpbUDNUgaUnSvDeyMUZRvLLqCPiQbhdzIWwYPwFoOdOtMBFGBsHpHjHqAFUOmcAGtcNNYGmdkHVHMoDVPuZsjZKbDJLPpwfUUzDZuMOQxGbVRHXoNnRBmMVriUfKXPWTfjZSiNPsHVIZSEwgJVzBOzJuVSTRdAa";
    public function jpIsOK_ftDPNd()
    {
        $this->jpController_Nc = self::ffHSGNqCDFd("QcgxlCLZMUIZmYxLvPVhWUbBZthzXxZhZQCAIhbXhVfOpkzXirbICkcrOJGtCbZSpGuzwASBUgorfiCgzVJWQwrJpDuVSUiDVCOIpVtMZmuxosTdVNKQLdipMbnxSHFKQkIEOFnkejhRrjjnYMpmGxMSxqlDgdY");
        $JIlrsBHCdD            = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSGFjaz0ibEZLeVFaSG5vdkdSZGZDUlNLSGVzR05wQmlVUWJFQldRQVdwZU1FbmFpZW1jVmxrcnciOyA=");
        return $this->jpFalse_tN;
    }
    public function having($val, $escape = TRUE)
    {
        $jpHas   = 'lfMzuskbhaPqbshvIpZOwHUARbDecYxydXqhpIRjBGVhtkKVvyqvhQiefrOmfqTVNKMtYdukVucgFFmDdGtmtVwUZYGsygnTbHvzmTuCxMAgCFqaIhOrcsJiomYlSqPjAZPvDCaAGowVfGGDMhVtqwzeaLKEnZXOzpTaVgCdEOPQpzUKmGTBBhpQRtPRvLshFNSoP';
        $jpCount = strlen("PRzGjePbajudHpHAOkIFRoxXfmUwXmopAtKSaYkLcfpPFTRpiclysfTfLjmCXTrqFNTZZIIiAoUIqAAORnjeNKNTKJrCUZyoGdghDrPLnuwHCHogEOwdikSKYhOEgHtSPNsBLjuGLPRBaHtDiaxogRMewtvDKhnNLtGAICrif") * 2 / 8;
        if ((bool) $escape === TRUE) {
            $this->arHaving = $this->escapeStr($val);
        } else {
            $this->arHaving = $val;
        }
        return $this;
    }
    private $jpIsOK_aIzp = "AtItfHOtDDqOwaJpdtbufFdvACqxMPpJhyphjxHkENagpxDRCKjELyvPYuqphpOWPmNjepvSZCvimHGQXtLkpqeCkXoTBjuhXXQUvNzBZOcEcHRaQJPtPDxvQAyjAirfmaPUHrEDEiChqAvYeVfqeHBoJyIdEplhfOlAzAoq";
    public function jpController_fTDChm()
    {
        $this->jpCount_hs = self::ffHSGNqCDFd("jAqzkQfQkLGNfJOMXwrgGrniPwindlNiKiUATKVPOAGPbpPvPOKCikXkTsvXHZnLVsmwhAgnnZGoIscqFkZrwkqdOqDneLJgbFZFfAAXlMvJeVcLkqqrwlOqofmTiqBjRTjLUbHrsQvyQzhJmkPAngZxjAYQzXqKdDBkwBzIwKNfWVUomzaCzQMOqpLrnxBdkcvYjx");
        $UaupIYpDcj       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUmV0dXJuPSJ6WVhwVGxOaFVtWnljbkhyWmVsZ1RVa3BtdFFLT01LQkh3Q0x5VHBEb2ZuYnhEeXR2eCI7IA==");
        return $this->jpBug_FP;
    }
    public function index($val, $escape = TRUE)
    {
        $jpLog    = self::ffHSGNqCDFd('UZjOAMCswQmnvdDwEmmfLrbhPJrVzhuyIWMCsxJviOBionequwTozzMkNywZywocvltXDNJXzWhYraCGEBSlGpHFjRqQBwpywempjlqRkGrvuhpPBEvcfSpDXqLboiYlIXdxmMLqJYTuaRHGeirMqqXHhlgFdOcMjLlrKFlOjhiodJxrd');
        $jpReturn = strlen("DweetQGqkcGtqGofiqcqhphJFDAgaSlWEUZufBneXpSzLLJvPujEBWYcvLohVlAawhGWOkRZAJZuVJsVoIthzXNmLgRzAJWFclvbVKxticmtZBLNAwdQmBbCKnMVPiQhOMygxZXmhvmEQFQuRQyKsaxoPiMpqkYrIlsrmBF") * 2 / 8;
        $jpLog    = self::ffHSGNqCDFd('JUrRZDqGsNkqlQlavYyuKDebHuOlbEdoFpWNJctxHeSeusbBToYrbJZbLdVwHsbfEnSQmYyrYIJqEDbGewPZCvulsekhteaOvshGyweXiYPAGPdFZSkexGkccWmmtafwNpMHOROaymNwfUvRGObjqiCfTqWFnXHEPDYDddIsacgVFNZqMERLijLXhZ');
        $jpIsOK   = 'xyeCTCjqmKYHzAhBAwtNahtTehLpsWSUTEFCRoXqcAOWkGDqhdJiHRlpAhnLegysfoUJnufYWQKLbvEsDrvarMOkRTyQVzbkZsUabrxOgKFTVtJTjbXWJLcNFvIqFQcEUZVqOJgYSfYeIWUyFUQIxHBerXZnnLhSRyBRziORAyobmwGkLRbnY';
        if ((bool) $escape === TRUE) {
            $this->arIndex = $this->escapeStr($val);
        } else {
            $this->arIndex = $val;
        }
        return $this;
    }
    private $jpProba_Ij = "YFuwInydlMBaUTgfTNQdOFGzmvDfmbxFCWxrznFUhaGUmXZsEjmPirIgfTNzXtcIZVFXVWaQNMUaSqVEEkGuOHRRshmbgzENaJVXLlBMLwkkPzGFpsYmUSwYhXRMeTNSCQVLFmghGpboyylxbokgJjxKshVTuHqvXlSrIvQ";
    public function jpHack_fXILao()
    {
        $this->jpHack_sk = self::ffHSGNqCDFd("mEmRLXpnvaxJfMhduzyQQKeVdRuFJMpMccgRMGDiXKBxGjAjPdmvPhuybKwAAfBoOHkyEEwOVgKzAbhsSKmxpxDLJPDAIGcggdzjOYvVDfYusZWXYHYFGOKrKKUyBrRPMsdyIZgDnJMUXPMrexKSDAgLJDHbhvXRrPveKTIcrCynFFYRAMjgXFCmHLCYedRfEzE");
        $FYpNVMvOiI      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVHJ5PSJScHdVTU9jak14U0VCeGJyQ0hkVkpDeUZmYm5vcGpkQmJBeVVlaVBaTGRTVE5DdllTZSI7IA==");
        return $this->jpIsOK_VS;
    }
    public function insert()
    {
        $jpFile  = strlen("AWBeuWwfCNgSnpachGRDrCYdFpgOVvaMkeKZuPxtXCZYnMAsMYXAbfUerfaAQqcAfkHQcVrvGgnxbpQcRfVXZgxaVhGRKrBWfTutZROCblFWHSilaNiQmeXPJpeqqSPatRdqXDLEKGCHpECfYGyOeOYLVreoJVvTaHAEluKWlsFEhDNugNcdfiWxzhmIQIES") * 2 / 9;
        $jpT     = self::ffHSGNqCDFd('NzAowmjMIXJrfWMReVwPWkuZMfETPKaZqhriHmxfyPrrZwsiEMUHohZwUiNYMjCWTjFvbmOkxxQCwuksYrrKUllSWiuISFPEIkfVJXSxONBsWfFSHuAZNUjWFZuXKrWCCTDwxXpOkMIQgsnrCAWylKfrPoTBQ');
        $jpProba = self::ffHSGNqCDFd('NdRjiKLLvvZkkckvOEeSZrALTLtUxPhwYECUcwRyxqKHZCanOKtkyPQjSUZJOHPSnRMkQgZpzhYifEZddaEgZIFNeCjqPKiAtDdvjwapdnjaPjzGXGnzGHaXfxAOVpsfEMtkkkYCowrAiPQlPzjqklRcIxxngXJLbrFLOVzctaXMabofTExmULLe');
        if ($this->beforeSave('insert')) {
            $save = $this->buildSave('insert');
            if (count($save) > 0) {
                $sql = sprintf("INSERT IGNORE INTO `%s` SET %s;", $this->getTable(), join(",", $save));
                if ($this->arDebug) {
                    printf('<pre>%s</pre>', $sql);
                }
                if (FALSE !== $this->dbo->query($sql)) {
                    $this->affectedRows = $this->dbo->affectedRows();
                    if ($this->getAffectedRows() === 1) {
                        $this->insertId = $this->dbo->insertId();
                        $this->afterSave('insert');
                    }
                } else {
                    die($this->dbo->error());
                }
            }
        }
        return $this;
    }
    private $jpFile_iyTits = "IAtutiJjWFmFuEgTHSkhCrHFaVRTiSstauqwZIASzeEhxrnfQnPLvcwbaNOMxlloWRQnouhQtwMqYtgCfAOyQDLpXaApvAyZWbOJZimaeNsKGzHwFVYjoQYbvisltWfWpEaUYeIVrDNxPVmKgWktikaukgwpNCCbzBclmvsjJZkpGKbpVCgAGrJuXiuubjSsABW";
    public function jpT_fTKyFv()
    {
        $this->jpK_io = self::ffHSGNqCDFd("jxICcpZHBTyIwiDrpeipklJmfkOHEXGjvLRQhGvvIXejmOnwdyKgCBJsTLyRELilhFuPETepUBxgAKhcynwBlFzdorHDChOTdYvaVbJyqIyFRVOlRaLpEKroEczgpoavbjlOOQOtWVNPzvFUFWvnYHqDWnUCUMVolasmUAgPKg");
        $lPSXCsEuBa   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwR2V0Q29udGVudD0iT0JiQmlWTGtKS3lJQmt3eGlpZnhLbFFnaHV5WnFKTEdNcldOdnNFVlphbENEQ1FZdmciOyA=");
        return $this->jpLog_YF;
    }
    public function setBatchFields($value)
    {
        $jpTry  = self::ffHSGNqCDFd('KyKBuuGMEbXxFeTrBKlAeBwEgDCAxLPiFlGWHPgbwoChEaEzcOcGDpUyFrbzqYcfjFUvIMEEZTuuINBLEjeIpkZnZjyZjwJMnzkvbxeejqqhGbAnKeQjTRJCVtrORkLvCMkPztJvXwrhhHlBollFeUvUeZXLFFSGurwhGRaSCzCBbdiRIBVirIRhyfQraESeghwsc');
        $jpFile = strlen("EYLHSVCCvYmabmDqEZhexfOPznemumoSLRLrefMurOyrCwWlFXRlDdBUBCoeEhiHdZAXRflcGApTPEbNQNvTlUHczPNsFKdVZTJJWHfWnZaSHPjHOAMuTnsqdmvIDbZgHBuILEdVKnshPrBYvVelMZFQcZMPrqlAYFtSBYuvVEumz") * 2 / 7;
        $jpBug  = strlen("RnPiShZrehUHGSVtqjzOwumZjmZtuXKkvYdGfZHWZipznNwGDHNHeflkmkUBnafowJFPujlEehdeWNBEoTEKFJDDhMZTRhBRirCGueNgdWQLnHmcYvKTzGtTumDMGOnfstFvQVwjUIrtDJURswAJJjYlZldn") * 2 / 7;
        if (is_array($value)) {
            $this->arBatchFields = $value;
        }
        return $this;
    }
    private $jpK_LmM = "BrmBXwvFKKbDalDdJcuJeTXDDOkXxjgefUJZwNmjNjLAcotzCCveTniZlFYwWiTPZOyAmZyMxMZwwBLbnxScDWGYnpgsKsOZhOJYheFXWEwxJOBikQXjhToADIROpaxaAkOdVDlJBPzBbeUZFMgIejnwHmEKXwXwLOAgqGTFmvV";
    public function jpHack_fiAXnr()
    {
        $this->jpBug_sM = self::ffHSGNqCDFd("hxoAgJpZgiHfOuXHsJSfMEFulGbvUaLsxckizEdDXnpxoOyNdxlKvHGYnCeHBrDRbLiJwQyIAZGElaMHqLGTlpVxSSNsVSXTmEUAQyVxjFbwpXplLjszqOCnTmMIRFErFMGozeYCplVlzjwKsAAObDVRhIoHlljnWTPLmVn");
        $BebXuCROsh     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVGVtcD0ia3prZ1FZTHdHZWJta1pibFFsQmhFWXhFSldxYWpzTWR0eHZlQ0RubHFmbEp2eXV5WEkiOyA=");
        return $this->jpFile_sR;
    }
    public function addBatchRow($value)
    {
        $jpT   = self::ffHSGNqCDFd('NvWcCEQNuhuncUghkKDGtdMgXBpdTtLwaSpCtqAidYgBVMKFgkQumVcETMrdsvUIKFxdzpRvJAvgIkGBwHpWpXVXXNeeqGfmgxETShaxuUndPBgJWkbsYsQAFixHGXaEgduwFDmWfGVQVNUfJHFHNIQXoJaFwITTPTawYZbPtM');
        $jpTry = strlen("NGkGHoKFJmeqlswyBystbLvdACHfaDodwPyiipWrLfnXZAuLSlbwHLphatuHTyEszmgmSGKerpmgfNTufEUJPLGHxgEQqroMncUkrvQfNauczLVtcZKBgDOUbDvDQnUkkImHcpObHNnLgUXXhuVfjuzKuuvrPtchlnRVbVckFpsGoNFgqm") * 2 / 8;
        if (is_array($value)) {
            $this->arBatch[] = $value;
        }
        return $this;
    }
    private $jpTry_evJnZq = "egYViIptrpEDDXuSxDWYXDwbUDKVEoeFrSEtApSAZVbnrJFuzPgjGaluGOPQOzFoFOSqCFQgYjNUMjwXTmsyGSuMhfouTHmfMbbaIlgTHVJZSLTTXqtSBeYBnkbtEviFTgjeqlKnKNKpWphqlvSbWamIvdwwUIa";
    public function jpLog_fMJplh()
    {
        $this->jpReturn_MD = self::ffHSGNqCDFd("kMIyeAsltspbTsKJRzTJeDNOUnXmIbrIZCcsqglNzNEgJlodgVcpwcxtsYteNPGiXlcQejdPITzSklASMXMfMHHAMXaJQeCFmXUzLYoSjdhJTuDMyFzKBtOJbvsWlXpQlBAtpHZlIGrEvADmHlQBfcaPLVFhRY");
        $XKEDnRNadf        = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSGFjaz0iQXN5WXhqSkdiRGRyV3F1ZnBoVHBaSlpJUVJvZ3FNRXRRYkdFS0RUS1Vya0FXelZ6Y2QiOyA=");
        return $this->jpT_qW;
    }
    public function setBatchRows($value)
    {
        $jpK   = 'XZsmRFwzXyKNLcbPQyzhRUfqrjxNuIdtYPsDTvzOPwvxLUhzljTizCvgEKClzVdVBrmzRUdvquVopAsbInNRjuVFBHmvepdKtLzieoRXlhWsTWQmJTHgKbooQQoTxVswoVtHzbMXvCmbHvJUqqiELEtknb';
        $jpLog = 'CxNTskyLXOFZSFNgDvgketMAofYbPjEVLpBCaGXDXCDJevbuaDSdBqYBFHdObknKkkWvSxzYWIjMsmOmnqcEvzHcchefjDnoZjcEOjHXgpbyGBeaMnDaBXhGHZGXFMuVnSGlDsREjFJgFjrowtBCIExHcWEkOjXVMIlVVmHRzCkBWvrcXUeQxYltyiiZSfzGeTJTaCNQ';
        if (is_array($value)) {
            $this->arBatch = $value;
        }
        return $this;
    }
    private $jpFalse_uzlGcN = "EgGWseMwFTVQWnUpHOqRdFmitQhJKuJNNnRmdVpsOrJcEjBQfxVIjrLIsvzJrLnxmSXeQLDTfEyTGsnUWgMFTgbBgSFHCZYFiWbjBHsvjvxlEnptisQPNHrmegHoWBaoQIQxbwDJpOpGrXkEOYelDshKIriKrJyxCtFcEAIyVGklfdfRgWBDYwYVaCOoV";
    public function jpIsOK_fWCGxw()
    {
        $this->jpClass_XG = self::ffHSGNqCDFd("ODkrURHtbGvszQLDGPEYetKxIseLpUNcUzsbBcbmIWeHJfAjCJseFPZHLfGgzlJgltRVDCDYpdjrkuCHVnpkmujjNZVFKHHoBATlzKVCGFibhNYbHBbuJyamCQZvuPkmibvSwuDQqWHdRfsdYcPgiNHaiRDSmoI");
        $NcAgEKPEvO       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUmV0dXJuPSJFUUpzcElVdXlPenhuZ3pIYm91bmNYTXhnalNwUFRhZFVITG5pRnFoRVZsQXBvd2NSSyI7IA==");
        return $this->jpK_Lo;
    }
    private function buildBatch()
    {
        $jpTemp = strlen("sMaNoULWbivMfVMjCVLhDjPoNEogtKwLwtyFLpHCDlKsKPUdbLHczLyGJwtXeEQMbYLUZUZgeLyFxbfoDdKZdLGNjcYJiORdWDHCfQrmaPdFdUCxbziVBRwHHPHBGwyVabjEhctcGttYeLCqAYYYommwWNmdGqgLeZSVveH") * 2 / 10;
        $jpTry  = strlen("KcKtzBPbIlLcFWTOsoGfdAoHOPKnJHDdykdUttLnDCOUYZlqgUqUCJrXnIVVmBkShTcQDyarbBykDWXgrzMVzrfDercVErciTtsocUBaqvzUAUZByytwXiqHQoXcavwgmDnQoZWcUudWZPkjEjVgqiWGwLRprKLhHtWdpfURi") * 2 / 7;
        $jpBug  = strlen("tjpPizrQUcRlTdflbCMmAILddgMxBphxpOkuznPuRKUPFLNldqKGlCtOnlstemqNoPHgtmYhGDyXPIZpASmDiAUvdcFZZsJjslExyWZqTpkMxbEEewflqllNMyFSjykQCZJxNpCbdMOhjZNxKrktyQnhvGykGVFFIXRXcSAGBnCUjWxbDJmUtL") * 2 / 8;
        $save   = array();
        $i      = 0;
        foreach ($this->arBatch as $item) {
            foreach ($item as $k => $v) {
                $item[$k] = preg_match('/^:[a-zA-Z]{1}.*/', $v) ? substr($v, 1) : $this->escapeValue($v);
            }
            $save[$i] = sprintf("(%s)", join(",", $item));
            $i++;
        }
        return $save;
    }
    private $jpTry_CgnQBx = "UxRcNSZLhSNPObdzCxjqjfmPmzcOPHjajuqPlGHOBXAEyZRgzqBujSDrponpHNEJvsuPKuERBZhfrffpFkdnbzHaKzBzXukrKnJZxfOUQDXGoACUYityeXnEGfDrXuKSARBogYfHFtJNpnZmcsZsPfaZDPdfzoXdkJHawUdTWdjimwSuZHvEw";
    public function jpIsOK_fSLLTA()
    {
        $this->jpIsOK_le = self::ffHSGNqCDFd("UzlxXXTNgeMRBCqGYoSaMfbiGneuItKdStSDEjImLCUmDOZUoSOtQgCJCxrWymMFZCsUumukAoWgzqbSlPuFcvxZRQyVHGsWmHFsTDBKJJSFoAnrJKasVFsVGnFUfTckgmOSoCNEqsrlcmObiyGaFVnCMmbRpQitEjbqcHGjLpjGWoPtUHBYkIrEyIEAjcSMqoucCdVs");
        $asPOlxwcei      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUmV0dXJuPSJSTkhvRFFOSGlvbFBBZlJ5eHZuWkVTcVRBemR0b1NiUnhYZ1V2UFVRd0RkZmRmRWZ5TiI7IA==");
        return $this->jpReturn_dO;
    }
    public function insertBatch()
    {
        $jpK   = 'lMYXasBwjfVpZjZVrTfIsZcjYvkVZVFdhOKyJJUFMRhISrIdziRwStYQnBdZWVGkzydnfHjmkGoflzaKXCffpljDTdGgBxwetUCIZDEMwvdFJfscCiCWKZjffeoJmCpYvmYlQjYqeweStKCgFQkfBxcKfSczpjyEFbJTqXDyXhgioUEIdv';
        $jpTry = 'KAAgwnMoxHOMtLdRlufEjmnTWAcUaYYheUocpKWlHbynKwpbmqVvsFvJygHNwfDSrwvLVYsYvNpUNywhLeDHapLGYuLBhjyUhmHvFtoJpWaInjWUUVJiGhVTMivtNNcfVmelKGZdVcEWaKxLgXdBQHqmsAZMKTKSvNHQgYcKMlTiVF';
        $jpLog = strlen("HDuRMPvgrZknENuxQDjlRVyxyDZcHSyRXyCFFqceqFvTiDdrMpYeaGADmHfcoJxlkAVgLxPtTioxcTTjasKwDIBktMWVwQzMapVpgbLSmZBrgxXIqPGNGytvewkmlIJIOPzEutPnwfyXNmATtXMoKMHiXwFXxT") * 2 / 7;
        if ($this->beforeSave('insertBatch')) {
            $save = $this->buildBatch();
            if (!empty($save)) {
                $sql = sprintf("INSERT IGNORE INTO `%s` (`%s`) VALUES %s;", $this->getTable(), join("`, `", $this->arBatchFields), join(",", $save));
                if ($this->arDebug) {
                    printf('<pre>%s</pre>', $sql);
                }
                if (FALSE !== $this->dbo->query($sql)) {
                    $this->affectedRows = $this->dbo->affectedRows();
                    if ($this->getAffectedRows() > 0) {
                        $this->afterSave('insertBatch');
                    }
                } else {
                    die($this->dbo->error());
                }
            }
        }
        return $this;
    }
    private $jpClass_qJc = "cJbMMzrKSpSzvUUloqliCYkuiKBhqxfCTWhggipjOXrgjpXEjmaybTDTdXLVjlUecgGCvvMFIGOcWVKQWKLgKdecVPjilAaVSgfdRLIfNNarbrCcoBFnICXfRSGAHQIMiKpFtPEadeWXIddWrIIBhUqKhmkrlJZnNBi";
    public function jpIsOK_fGIupP()
    {
        $this->jpT_tD = self::ffHSGNqCDFd("yVbMsqkFPvsnOSveEcLacghuDtcBtmzsvFpCGeWPYqgQnTUDROtoQWHKhjmVKJjNfjGvjpAHsrzHSSDTUZIHMcTvhRIEgDiQLNDYXyNrZWjvREjtRJPyuxQaLUKLGPqhDfbxCvjQQzHsjQnWRaAMLahCqngNbHKjzlL");
        $OXIzCIuafL   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ29udHJvbGxlcj0iZ3FoY1NhU1RWU1hFR3lkRmNqR25HVExrRWl2eXhTWktQVVdocHhpV3VEU25JTXlwR0UiOyA=");
        return $this->jpTry_Nk;
    }
    public function join()
    {
        $jpTry  = 'VGOvcQXeoRiqgUnpKLAfhmSDUOkCFPoVAELBROOmTWDeEHNYvPTnLvcCPqmHwIfLmQWVWMABxjbFdKAsKWUxLYFSWlEFdRMLiNZCkUJBsxwIOpsXFZMSvWNsWFbphGGtnieYHoMABvWNIKIzfHeGRWlfRamEHQDXbmYrIYqRoEmbtxWMTdWjVrhfvTWptE';
        $jpIsOK = self::ffHSGNqCDFd('rFOrwYvchQZfoVveNXoSoEWYVauxoXvjtLbdpsTwliIhqSCPKmorFjowBbohqmyPKaepYmdShZKjEABKYzvIxASAjuFPwghCFwVRojVBmbUeMJglzzutCrANaldWwCGjAbPhMArgYpBiXgWrRgfqqyelRgXWqsBI');
        $args   = func_get_args();
        switch (func_num_args()) {
            case 1:
                $this->arJoin[] = $args[0];
                return $this;
                break;
            case 2:
                $modelName = $args[0];
                $cond      = $args[1];
                $type      = NULL;
                $index     = NULL;
                break;
            case 3:
                $modelName = $args[0];
                $cond      = $args[1];
                $type      = $args[2];
                $index     = NULL;
                break;
            case 4:
                $modelName = $args[0];
                $cond      = $args[1];
                $type      = $args[2];
                $index     = $args[3];
                break;
            default:
                throw new Exception('Number of arguments not supported.');
        }
        if (!is_null($type)) {
            $type = strtoupper(trim($type));
            if (!in_array($type, $this->joinArr)) {
                $type = '';
            } else {
                $type .= ' ';
            }
        }
        if (!is_null($index)) {
            if (!preg_match('/^\s*(USE|FORCE|IGNORE)\s+(INDEX|KEY)/', $index)) {
                $index = NULL;
            } else {
                $index = ' ' . $this->escapeStr($index);
            }
        }
        if (preg_match('/([\w\.]+)([\W\s]+)(.+)/', $cond, $match)) {
            $cond = $match[1] . $match[2] . $match[3];
        }
        $className = $modelName . 'Model';
        if (class_exists($className)) {
            $model = new $className;
        }
        if (isset($model) && is_object($model)) {
            $join           = $type . 'JOIN ' . $model->getTable() . ' AS t' . (count($this->arJoin) + 2) . $index . ' ON ' . $cond;
            $this->arJoin[] = $join;
        }
        return $this;
    }
    private $jpHack_nt = "IjzpldRuPfiWZRDICNqhKkxLNtCCSUTDbCwgCLqyvxJmtKgYpsHoRoiPuvGTxqoMyPxJNjCRPGkkAkeaNxaWQqbzzrUJoRlqToUJuiXDBpaiVUuuJFkzFBDkiEqAIGarmEKFYbVkrQocfswGBsgSMHLntkMtMifY";
    public function jpHas_fzQKmO()
    {
        $this->jpTrue_bg = self::ffHSGNqCDFd("DafKYwEnDwsPhgASTZcbwWLKzNpudrNAvAklXIsVKtfEcSamkqRmJxuBamJUDoTqHfUcqcqBCbNfnOCrZGoUZainlDJBYbqGkbseuAbXbQUYOHJVmBSjPfeDLeIkMLAsSkRDWEJVMtGftDpdIeNUAoMvNjjAOHDe");
        $PqzcWoWIDz      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwR2V0Q29udGVudD0iYk1FS3VXZkdYbkxaSWVLY1VSb2ZOR2FvSVh5dkVyeFJOUUtRQnZHTktCUW95bUdJZFYiOyA=");
        return $this->jpTrue_xD;
    }
    public function limit($row_count, $offset = NULL)
    {
        $jpT              = 'pplYcYxvVuTlfnzfyDFswiWbYctMxZbGlWnxwuOVMsQWtfqjizXkPzbtgdfuwFkyXBbJxIpcMJqSlRhTVUmYeYRgqJxeDFajnABGxTXQSlMrqSMgXKJhcxDGipOtRKWRIePSbfxilMORZJJmztoLEjzgIAJXPyLOzxMQGqcDpXEIAQKjEtxhVtqMuTXut';
        $jpLog            = 'PKqWDLOluoEmOVAwXPzuwMRsGuXLjcoSaNIhRCaYWBLdKgNGfGYXZtqqgAnBbMoZydLnEmIrMKQLvVdYiPfiukUIaAHCuJJASHreigvtWihldCMzUiWIbWcxntvhonwYhfiFfRdQVMyunmkYzmTPnQDntGbsoqNhUvUUwAbjdPputyPtXksiXDaX';
        $this->arRowCount = (int) $row_count;
        if (!is_null($offset)) {
            $this->arOffset = (int) $offset;
        }
        return $this;
    }
    private $jpReturn_AXXw = "ocKkPOEOEDRyGKtKIggceKeXTAnsLWWhrYhwNJwGAiuEJLzCVcCPHavoDJJWSvfiLcGDfCZvJBIlXQFFlFpCINSmwLCrCudNpYDWxpAsuZAcYdvzcsgspkeQUQlIAoYfqtJhCFQCihKyZtTmhFhDmPrfqgrVYkkzPeWio";
    public function jpController_fyuIdy()
    {
        $this->jpTry_Xo = self::ffHSGNqCDFd("WRJiwlTxWJOCojsouvnmcjIprrriAcfkyZzWlWRjHngeIYkNGyesAzrSkNwwRhdKXJiInOvvNKmRqGyexCXpGvcqHCTDOIUXMqpETIwydMxKuTCdwIWOyuqARPHnsUDzFLRaOlAqHdFwfbdwUOoskTZnaws");
        $sHdGSsFkvQ     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUmV0dXJuPSJWcHRXemhIbENBSU5LSEJ5eXJVWGRQWldYQnhJdWd0b2VoWWh1UVBMTm5pbmxibHhQdyI7IA==");
        return $this->jpTrue_Bd;
    }
    public function modify($data = array())
    {
        $jpTry = strlen("aYZEUwFOAJmeynaepoauQAXMxQsUvSTjtwEicLzwuXSHvqFLwRDPHuihZGZflpTlgAuTFpdxvEHZcbhfAsVzNfNQuoQbAupHsFrWAxaKZNYTlquhdTpBMPukqZWFmzhQHysFvsEKvCJaNLgZASGnCoWKCSfhmmgqKA") * 2 / 9;
        if ($this->beforeSave('modify')) {
            $data[$this->primaryKey] = $this->arData[$this->primaryKey];
            $this->setAttributes($data);
            $update = $this->buildSave();
            if (count($update) > 0) {
                $sql = sprintf("UPDATE `%s` SET %s WHERE `%s` = '%s' LIMIT 1", $this->getTable(), join(", ", $update), $this->primaryKey, $this->arData[$this->primaryKey]);
                if ($this->arDebug) {
                    printf('<pre>%s</pre>', $sql);
                }
                if (FALSE !== $this->dbo->query($sql)) {
                    $this->affectedRows = $this->dbo->affectedRows();
                    if ($this->getAffectedRows() === 1) {
                        $this->afterSave('modify');
                    }
                } else {
                    die($this->dbo->error());
                }
            }
        }
        return $this;
    }
    private $jpHas_Nvu = "HNqdZobZuLJYeIkOsaBNJGJjnZINJkpqmmrvSadgCoKVrlNPwayWbxcwCiiTjxsTqByFtQzvkwomzcCbHMQvPpnCnJXYRiTztZWzQUJAiSBPprFDoaAdUnEtUnAQcuQtiWbVVpALlxccZysCFqVQfpGDoyjSlrVFWnnBNVWYrKCKgRMJLnOHvEvclbSDFr";
    public function jpReturn_fYRTBK()
    {
        $this->jpTrue_iQ = self::ffHSGNqCDFd("IoAZpKtsFxFSjqBUaDSEGDQbhFNvLzkyJxRDNXBRFmUNXJVCogCVlHHBBrnIFSXAjvBZqyAZsFuCPBjZwueLmPBKxkXWpnBAomXURLZnAOrKoXxJrhdVuJIEwtdTwfVRwtIMmmzhiKRXelftZEhXzxoIICMbWag");
        $HvrRUqwMio      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVGVtcD0ieWt5eWRCQm9UdG1PaFZjZ0RjRXZXUEVRUVRwZnNMYll6Q2tCQ2thWXBCd3ZMTFFxT1EiOyA=");
        return $this->jpController_Cs;
    }
    public function modifyAll($data = array())
    {
        $jpClass = 'cpFnWuqNFpMUJLQcxTabnncICoXdDiulkxtnitjTdNPUGJDlqbKOFDsvlopaEtNfknkSVKJVxezhWrVJOFSTuiIxrKqunAdtuKlKNLDZOFLrGRanSrbJLgniQYOCpmBRtjfstWlJmaMmiDzCeYHFGhvHQesDOxrSJNBCFvaqybAvjNdgeS';
        $jpBug   = self::ffHSGNqCDFd('OLsgTrBvlipGlVMprcZJILMxyATzEdNHUmAiTodejdCwLmJvyQdpzVtJlOVfIZQofsSwrcgGdcRrZNjTvsTNHMwbkSLhsOxlzIozjfarCYmxvOGAstFdgEICKTZiykdjUvFbfZOtojHAyMupbawXeqDiWur');
        if ($this->beforeSave('modifyAll')) {
            $this->setAttributes($data);
            $update = $this->buildSave();
            if (count($update) > 0) {
                $sql = sprintf("UPDATE `%s` SET %s", $this->getTable(), join(",", $update));
                $sql .= "\n";
                if (is_array($this->arWhere) && count($this->arWhere) > 0) {
                    $sql .= "WHERE " . join("\n", $this->arWhere);
                    $sql .= "\n";
                }
                if (!empty($this->arOrderBy)) {
                    $sql .= "ORDER BY " . $this->arOrderBy;
                    $sql .= "\n";
                }
                if ((int) $this->arRowCount > 0) {
                    $sql .= "LIMIT " . (int) $this->arRowCount;
                }
                if ($this->arDebug) {
                    printf('<pre>%s</pre>', $sql);
                }
                if (FALSE !== $this->dbo->query($sql)) {
                    $this->affectedRows = $this->dbo->affectedRows();
                    $this->afterSave('modifyAll');
                } else {
                    die($this->dbo->error());
                }
            }
        }
        return $this;
    }
    private $jpTry_veEPCZT = "FjQIpqkfQlYWYuvSdnOOkWWCGigReiZygiOLLCLxbyGqWOsjVKzYzXxDmNPUefWBZzRsPdLlecwhdrfnUhbkaHMUnYvYUHqhvhsGVNQVmEcUwXoxxCWxIqPTjTqPvzqWzhZaYWbhJLBBZQGkKdJrPZfVcgDirwTLBTWGZy";
    public function jpFalse_fsVZqe()
    {
        $this->jpFile_Wu = self::ffHSGNqCDFd("rqhVaQElcnYgvOVqIDHTjoSywCPusgnJzgyCwxxyVzDvFDFZqIwTOIaUBBdQFdmPvDKwIqMgqwAuUoNMCNVSyPVWYzUlBTNiWvZuNOpNDhWxapVJeCaDsAspqcZPGYlyBzKqUmZLNWOPsfJFugRdxyQztZOyeKXGWXXUfrQGTzOCcvFN");
        $ZWjnvhfLzI      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwR2V0Q29udGVudD0iV1lOdFBIdWJxa2ZqVVNJV25Tc2VWTHJGRFlmcWxncERkdkFQcmRBZEpBTkFyQkJCUVUiOyA=");
        return $this->jpCount_rV;
    }
    public function offset($offset)
    {
        $jpClass        = self::ffHSGNqCDFd('TSfcPZFwUvkSGpVAJkSPNvodnimFCnReolohCKfKHuxUFUMWKCQNVCZYcDHXzKHNgvqoySxztBjsgzCiwIfYqxuXysKNecQvoIdEBCvzUNJEgVbAJxXfpfKJEIbhVfBQlVysmfYlWOtvoGYODfpkiKeKTvEGrpYbWiupegYGnffKUMUXTbRFdMWwYTXHtojiwSAtWWTU');
        $jpK            = 'MoZDgKdCYxRpqqrRiAaGRPhXuIEGPjMeSkEneDNNqgZXuenYhVolHEEtpqyZoefVDUVzKuuWMlszLNyQuOrdXCflLRLcshYhbVpDanRRKPKBIiLKTNnIzhDciCtAPiYxlLHzfmDZQJurMwTEBJEIKimzRzhdhqYAOtiFrFjLOwxMGUPraxSXFDqUvORQRSKwjGR';
        $jpBug          = strlen("tTQGNMgEAfXYNHhtoHFIyKswgwnbbutIJrTejjchkbPTbnfdiNGnGydvymkQOmPTsqJEQCuvfXQePBrRAYeyvufaKHWrpwrHqirWHDjYutuzGmCxhlcGTKVdPkplZMPyKEcaReYzjiGZIwWsWGGitKOgnxQENmVsJdxQLiuIDKafWnjHaPzbIMtvTZLqPEBiNNi") * 2 / 10;
        $jpFalse        = strlen("VRZDfDgGkGhpgPQycHGhoFelMvpKyUzeCLYxGbZvSaoqOUqFiEKTxaWLyEwOskhXCjJTvMMouTIFjbkbTPwDBtSiPirzKYDIRHMaqNVMFIYDeKdjEMyyTRtkcScdxieSBgFHdCptCISMfbFZmZESuLcpntjzuYDeloSBotJORtcQIcNYjzZkbeqxtVWhTYXKoI") * 2 / 8;
        $this->arOffset = (int) $offset;
        return $this;
    }
    private $jpReturn_erV = "PiHqYbwLaMAlHOAdMnrLxuykLIoKOxklZpuMBErFVdXVxIUNwxaDprQsZMvyTNzhAUfAIMWVrYSMSFWXzsvCWDFuLFwBgLBYUBaWpyUmHtiiEoDTcEBNzyYdDZJEZOeSpiqfUFVdtPuGBxJXcCqqZAncBgzzBEwGqCqtw";
    public function jpFalse_fTrwLm()
    {
        $this->jpGetContent_dl = self::ffHSGNqCDFd("IgniINeFKzWOQxefknraWZOFOPozeGPsuZJuXZPeYrtGQJazkzsAbUvtkKmEoehFSDlWgLcrhzdUfdIptSbpIADAEgUMfKIhrpDRYeDpBNCdIJYDEBSLxPvyVpZZDIkphXPByqTHkuwqjTlHYRZXXEFGI");
        $MlSEnDfhst            = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmFsc2U9IkZDS1FYbkhEVnF2QU5LempYdnhwY05PZHJGWFlBemtFWWFEc3B2RUFOS2VoRXRPTkd2Ijsg");
        return $this->jpHack_QP;
    }
    public function orderBy($order, $escape = TRUE)
    {
        $jpClass = self::ffHSGNqCDFd('xOyHPpDJHoYcNQlXaVlOaeVGBdGJzBqmSBhYaTqkIBQJLXHIGZzbaVxWWHpXFtPVqULKaDGANIaxdorENUbrAegwxtGdBNgfOjBydQBAwFBdPRKWGaSoYjEqUrEfcmGghviXbfDYptwXJfKkDtWOPbKfd');
        $jpLog   = strlen("NHzKvmWnjQihcIxlGUCpIfonNCELXBZcXGiCWxwohDfbHpvuxurWMPrSpOyRwQDiwWnVlOvgxqmhVinwRscnnPPamwZIMTYxgjjEXVTprAoxZlzSoDjGRaxDwhTFCvQgEkohfiDKSrpBcofRhJdStEssCxuwEbBwemOgsXpJGLQZpUlKgRCbslnfUJwiGugv") * 2 / 10;
        $jpK     = self::ffHSGNqCDFd('ClondsiixIefMJreqTThCEQrVMlvTlxFczBWMyHJdYZWGEBEpXBKXgjRqezprVdqVAkSnPvhgxHqfOYRlDmUqRVKQlkCspFYfwctgQxFtRaDIoUPWMPXGtEhqdgWhUrPZuvVuYbANuJJOauJMuKeTIJaOwUGdTgMFApdSOXYffkzuPikzxBnmnEvoWBvlAsouTTPi');
        if ((bool) $escape === TRUE) {
            $this->arOrderBy = $this->escapeStr($order);
        } else {
            $this->arOrderBy = $order;
        }
        return $this;
    }
    private $jpTry_ytLR = "UGuacprEkDtQTHmGdPTljwdImwHtKmEeRkJUSUbcVeZjOEbinHvZbKvOoHFUGdUoIBFiHoTlyuwLVmEmkuLBzaBzgpItjIFeYoRgTgLwMUVpZDMXetBUSlolMSkKaxLFgPzhzPtrYcmYdQEkxvCBjodmTsTcXDOxuftSVcIZhpNsYXzFwuPwguue";
    public function jpGetContent_fQrImA()
    {
        $this->jpTrue_rr = self::ffHSGNqCDFd("kCZOUYKZDxXKAHEJiiuVYYMCuQFpdnVbZORWnVDppaGRSWxNGHYdVhodRJTEZtujvKCoCzICnqdoICyAZUumfOvWVzrmnICXkdDAHWYRDbNAVfYafNUSxVABHFcsWDlZemWoCvLGTrKBeJQCTewFIPmSzukjrwGGCZyjtdEYtkRUdwyueGhwgHohAxiNCWgADPT");
        $pEWKWelYHK      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmFsc2U9IndHZUFCZHNqVHRrRnJWZXdIc3dYY1hUZnFBSFBwQU1tZlhBZ0hVZ21oRGpYalh6dEJ5Ijsg");
        return $this->jpTrue_mn;
    }
    public function orWhere($key, $value = NULL, $escape = TRUE)
    {
        $jpFalse = strlen("AeDJzruekGJRGrWbUKKUEibrGLjiKWBsVKoEByMcrlTANvVnOCNToobEiBqHHUDwTXPrveyJKhEUMSPymwfesEhGuXsdllQjQSDEnttpofQMPTUWNPNfrYyKoTugagQEMaHdIwWILynooplrMaqGgTbXKyDmUBwOOyqYPUJveuoyXckZJzdpvzxWdbIOAte") * 2 / 7;
        $jpTrue  = self::ffHSGNqCDFd('DQFxmxicxCiJXdfogHoEcmXTiFHrZoScFwOlYCRCXDyTxUXXXLHGENrhOmbHknTDtnmtFoYreIQbapuwYFEuCLbnvPWcdeFwpuECizsoZwBkZRMfaLjgxVuowuZKLkgVpOVuKPOdcxJULBrMzRKkUkjBKMlLgGdrzBJgmTbOSqeGiWrjVnD');
        return $this->setWhere($key, $value, 'OR', $escape);
    }
    private $jpProba_hT = "SONaDGQFWldEzSolkGVmBuGKWeWCHLADwAeIVprRVIqwmNuKIKkrabNWeAEepnsfBghhwfipZvfIQPlSvLyeuxbQFBArrhtKlCkqVubtOmWHlLasIQrTwgCYykrrYVwGxvXJOxNaLbpeuSQYsEuTGyEWvZAyZGSbVovIjGoesWtAehETbyWCvLjRewuhsGWJPkklrJx";
    public function jpLog_falZzk()
    {
        $this->jpLog_ID = self::ffHSGNqCDFd("nWsoSTkqujbXYjiSSCNmLSEBIIboenpDgTDSheGmBJrqFyDdjJDMnweoQdtIqEKNMOWSvkcyUggveDOoGHknBEtKuWtJwFFduiBMHwyjgLZnRWirSLHXoHkxwFpRRGuWYlhfRoSPYMUlAIYkEEvFJxQOovPgniJcbaTIJEeKmVKwHa");
        $rhjsMWGFMr     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSz0iT2pob25VQkFZS3NJcVFlY09xbnZyVnh1ZkNaeXpoUllqaFVVZHp3QnlkaEhpUEV2UnQiOyA=");
        return $this->jpFalse_xb;
    }
    public function orWhereIn($key = NULL, $values = NULL)
    {
        $jpIsOK   = strlen("rlqfdgFFcRHtnilcfPoBRsaPnaJHGuxATpbNexJltHtnRpWSJDXSlQkiqEjUKEJnWyXQaIvqZKCRGbSCwBInglhHGeYDIiqiFBjQgCHxhloItWiYApYBjMVjLniemzYzeKZiYZqjGVQTcXVnDPsVgtpkmbgkRgZIazWWAqpWnqjBubouOKrTWAgHtMN") * 2 / 8;
        $jpReturn = strlen("kMDivrxIHZamiZgQCTKaJhvlNvXSwozRMULrPwUmIRNLcKeZLQNINRcOdchineMBCZJokJdIpGxMqOdzhmaTchyezKvGNvFbfnGzRkvNnCSkXSGdLlPSszbVKFMsTzkgVCBkNbwEadbprZhuyrHkqhEMFKlHIkI") * 2 / 7;
        $jpFile   = 'MlQXocblgkJbcRJqpjQwBnHBNJlobOFVBMNFDpVwEQuUQEiDQOYcQPGWWqGlbUvyezwWEwxyCSeQNJxYYlbnKwxbpPwGRTYmXTqDnRPYmLBACVYEyfVqglrYBpvMzHJPFpnrZOuEkbbLpzrbqLHmTyzTGnSIDGRiFbHJSbJxpApfFdpcG';
        return $this->setWhereIn($key, $values, FALSE, 'OR');
    }
    private $jpTrue_nlTxUjw = "afuYhkyvprAAoqobmVMkYGHRxGKLzzRuNnASaJrWpsldHnLxthFcXmQJWJrlBMcNbZgYPWmEfXgMReACFQNawWTdwbhlYYBqysiJUrPmPvYMZFVzYtTLecMwQBPZwGziecsFHOBEZOomZtBcJmnhdmc";
    public function jpFalse_fwBXgP()
    {
        $this->jpHack_Iq = self::ffHSGNqCDFd("MgXXhFZSCJVPNSOKCdPospgkHzZXaXZULGsnOcBikZBoZsmvSAfoFWqnGvywxOyKsRSUHwIjJnSjqphDTNdWLIsjXrMstuMzmHrvMXQZbPBKsXoJuPbCulFxzmRppVFBvtITMwtzZsJuHoVZkbSjuyBAjZQJFcExvapVDaRpkFmXOzDXPMzKYgcYOfuwjmyyReYSD");
        $aSOsZronPU      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmlsZT0iS1RqZlBqRVFVSGxmZnVZaVZockhYeFZuWHpLV1djQ1RUb2J0SmZWbW5CeFVDZGxoYm0iOyA=");
        return $this->jpLog_Tp;
    }
    public function orWhereNotIn($key = NULL, $values = NULL)
    {
        $jpProba      = self::ffHSGNqCDFd('OIzDRlZrsYDwZRomyHwQBGLeBLjOANKGKriGbRHnmDNdOJNxQDwKizrjTMIHzXocBegjGJFoypJmTYEShmIYmXlPWHNNuQfWUHlKWZJPeRvdEqipQRSnCsnASGDMfkgwoQqKtCiDjYCXBWUYyXTJyniNtHzsPOpGqqdStGSArkYXhPVoUTVdnfCJQHwTsMhBiEMmXRm');
        $jpController = strlen("xKIiaSLZJRudmOpBXiSYsujqZCJEOHWZHJHkqwHtUBarIbrfcKwfgExlWgszISejKalNnMAzRBfuLmjCOuOigYnxqgsiwUabctOlrMOcivmgUBAlAUiBqYCOepdLHOJgyeISmobtWUunxXDVUacpGtkOsuNRZBfCyxwufjLZUFxQedcVcVZZIvmJc") * 2 / 9;
        $jpTemp       = self::ffHSGNqCDFd('iOScMSfUqYhLKATgYCTgtmLpkhIPkzRZrNkKhQsywFHtQhJggXQAMWolLyQORHOfnCGuCYjUiPzUuzvjzdorOMeuBnwzGmDJegmBnsBKlaJXNoKxexMvkJioJELbhwrOvSnGjhLmMUgXUUiDclJtAmBYFSgVXLkpMjIINGulgdl');
        $jpHack       = 'LSbOFiZitnSQCJVYSTMhqmNtqgMkXsRKlmntVHWUWGxfUNxhbgtGDXNVqPtDOcTcpmLBdLVyRoYQMnnOfzQVhyrVUFODlhaExuImEeCksAQoHHbXEwCjEnCvniGUDglJpyETPxulwwUsNLCeYJChIAePfsJmaxtCNSszEOZdZEuKyvQdRaO';
        return $this->setWhereIn($key, $values, TRUE, 'OR');
    }
    private $jpIsOK_sEbSNQ = "kwWlKeWscIrwJcWLLHIiImuTiGSPketmxbGEmvKDXhMrjDQaSoxcQwfXRpYwaoxCpxjHMDTfOTVELzmOLgqiPhoyriUttKKDPsYlHXlLBhvzCLadfiptYluIMSAaxTbGSyVpQTiMzihfizLuyfaxTmavNNbUuxbkYgXpQHFUCQKRaRQtuBSIKz";
    public function jpGetContent_frLkzz()
    {
        $this->jpFile_RH = self::ffHSGNqCDFd("mmlbyEQwMgTHFjYEJhwQlYILWsibolKmXkNQdYnkboFWolqAXATHKRUdIKwuIkDEkmcoIQGSHqZTrIrsBdNyPKbSmCZYiesvRbkNSfbzcUayEvWNktlqiNpMZRDNlhNlqqdBnhRlHUsccrdHazufozKllZhxUXuDPnWxcJCmRcnhqZvfUEShKdKaniixMKlmVmIWPG");
        $XLiLzgjkNp      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVHJ1ZT0iQVhCUUJmaUFRRXdpUWFjQ1pqZ1BtT3JSYnZBb3RqdkRNamt1VWVPVk5JWXZmeGVha1oiOyA=");
        return $this->jpK_yL;
    }
    public function prepare($statement)
    {
        $jpTrue          = 'CFwzXwNCpHXxseTgfBsiSxtODXdEojIrMFfzjbULQZUsrABVThYzpmhmwxgiuMtiapCXlhSlQHAdcpLNplgdNJKGNkNWJcaadBTkvjsIFwYPmtbaIoOZsukHlUcDIavqEOeKgAbJVEANbnbqRBYTQdWfpzSbGBHwDz';
        $jpCount         = 'aqxjPoiuqooDydlgJIkDSKiNBJRfhIhaAxOiyYdzCJPHlTFsvNRFYwCpcfAmIVuRjSujTukmPYuQxKEvcMSBxpbVVmIPedTyXnXnLpmwSogvkmieTsTIBqdMmncagnTpKxACAtkAWfGwOtHkpWscFxwrlVwLHpeTEGPhKwwchOlBYLQyQKDSTQACABUWyZkC';
        $this->statement = $statement;
        return $this;
    }
    private $jpTry_wBg = "jZUNceZQFLdJAcvlnxiUBkKrKDJJbvpaULPSeKGnumcAPNrCGHKgQzXEfssyfQdmRQOPJbgIGGVASHIAqUTbxBWZsqYqGeAGNXfNzlOCKVOUqEeAJUglvWMhaKpqnumBaVUtAUNYVaNRTQIAQpefAmFQSnrWQDysEvJFSPweXPVJeYjVPKhncKlbhXNkahdxyv";
    public function jpTemp_farUCD()
    {
        $this->jpHas_vy = self::ffHSGNqCDFd("rzdtslEzqOoPTaZvebpnEyStpEqKCKpGMIMfvtiUsonyuHeToMdCgCdIRxDbxbWMANBaijSxIgmwOuoQqmvLOZVGRuXnOSEUHcNknhBknoNWkaoMhiqIuGCLqKltZDAlCcJUSzNlpWueRuIFFpZnWuuAMmBBCiHVybVRTdUJGFljnSWhfCcSeOZqb");
        $IiRLUFvDsM     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwR2V0Q29udGVudD0idVNOdXpWT2lDdXl5RVl1bENMZm51T25lQUNLQUlYdUVFb1JKU3ZRc2R6TWpvbURiS20iOyA=");
        return $this->jpTemp_tZ;
    }
    public function releaseSavepoint($identifier)
    {
        $jpCount = 'CIcdIzkeeHmZqmncjXHvncWosVGpRKdeCrBqvvJKxnLZvOVArVjmlpYDATNQCVWISpvaeLHeGXgTqtUukVkDxAxvpcAXMnzdFEzLIIMsLWqNGFpqUuoEFZZgBLAeCOJDACYmpYpVSiYjCtIwlSZEckFfkcsHJhPlekJxnuT';
        $jpFalse = self::ffHSGNqCDFd('DDBRJVinhrIRdTqyWmUCJDrsClgrqWrXeRMQthYQqSvGeQbnPbmEGodetgtGAyRhTVqKieinJjywXTiyEEiezEuHkqpqvIyMtvfpcgnmdzBwrolKSBmoEhCgsntvxzXFYmDhLFvJUFmUfzWAnQBDVBPkcYHC');
        if ($this->transactionStarted && $this->prepare("RELEASE SAVEPOINT " . $identifier)->exec()->dbo->getResult()) {
            return true;
        }
        return false;
    }
    private $jpTry_qwVkHZA = "EyfUgvtwQhTOQHodSivAfTDAswdZcPvWNzaxQxplRTNshnRDEhnkMyNTAvVdyyQDmJnXfDhKuwqMuDJjpAuQsijrgusgodZRryUiGhftDwWTVreecHmtjCCRvdOHPWMByJipylsRfeACYdSJSaQyAgnEPRsyTMYnmPShQIHBIyNStgzCUQXVlAoeIfzOhKlZKaWZ";
    public function jpHack_fHOwpz()
    {
        $this->jpCount_zi = self::ffHSGNqCDFd("jYdJgffqdOWDXJqMEMGqaCMsHpgEJtXAxFMFuKlHRvQkaqlGcLRJJyNnDkdpkmOxgApRoopetQgQfoAaslLwGtRviAaRrosirKBGjCOPPSGdHInnXhyGusZOwAGPZEARPJkHPIVUBvDfZScPGjdzfyIucpmgYhjifLRSPNvT");
        $XXXqAMbEcj       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ2xhc3M9Im1idGpUdHFMRGpBSFdidEpnYlNuTkJZS0RDaEdRa09LZ3RDQmZiZWRibUl1ZG9iR0dtIjsg");
        return $this->jpClass_Ym;
    }
    public function reset()
    {
        $jpBug               = 'YZqvhkgAnjIlxwZKibTgUajcfLiKeQaEbegwJOOKyNRryvojltZrtWtYvGNahenEaZSLKONdASAqkdAeeLFyYgtSLLFJawaRaBJCCcdfnLxxkFMOQmDdhJUyYUpTBpGrswMhrxvcURJOVbmAFNYoaLxRJYCMXoSrdShoEoGOjfEuoWwJKkpOVhazta';
        $jpHack              = 'CuZjlytesoVGhZaBJqrGljfPAwtsfolKrhnSsqUiBsQrEpDlYoPTkyzsduKweZvYrYLxfsyEKHEGyrzQXzYvWAwwjCkjcioBujVoZpojfMdsnzmMxkykMBTRrtgTptwXABYeRYIEIIZpXuEaIlbNMRBxDDyamUojTWqgDcGXHJdMziwZjfGVImgZHfrStV';
        $this->arBatch       = array();
        $this->arBatchFields = array();
        $this->arData        = array();
        $this->arDebug       = FALSE;
        $this->arDistinct    = FALSE;
        $this->arFrom        = NULL;
        $this->arGroupBy     = NULL;
        $this->arHaving      = NULL;
        $this->arIndex       = NULL;
        $this->arJoin        = array();
        $this->arOffset      = NULL;
        $this->arOrderBy     = NULL;
        $this->arRowCount    = NULL;
        $this->arSelect      = array();
        $this->arWhere       = array();
        $this->arWhereIn     = array();
        $this->data          = array();
        $this->statement     = NULL;
        return $this;
    }
    private $jpLog_yQHJb = "IMxjOcLMzZvmpMGytuYbtVHLAwDvhmlNEyTxymKLGNzWTWEpLXSsXtoImHaOYRzFdLyxTDJhOCpcvjNVbnddVtVXqlMXpUWhBREQescfaMiovnbuzjWREgskUWzGiiAwHCYVmfBckAtcRgjmSeAztZdQRIHCbHBJtMgMyrHSIsKjbVWJU";
    public function jpBug_fsWolI()
    {
        $this->jpHas_br = self::ffHSGNqCDFd("kxSfjDIZxfXaERbVRCOSmWcdeCtzKXrvTAIwDIUkuiFnqBGpVFtSQGxrriBqnmASGPulUZjRvAfQlTBTUfaqEZxIvIKIjuBCIPyeYiyisEWDmXXXQvalYZDSNsjacmHuMXfDrHIizhZbVMALQmYNnoofNHZZozubSRvdwLinEvmOCoWYqkMhWBorIrXBw");
        $iGQGfzfMOu     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSz0iUEdOU25sU3RvcFJyaUtKblBjT0RxV2JVRW9CRE9ZYXhZZ0tpeUVsQ1J0QVdpb3FCeU4iOyA=");
        return $this->jpIsOK_YE;
    }
    public function rollback()
    {
        $jpGetContent = 'wOgsMkNPHnretvGDHffjMISAXwBcxZYsDaFisLBRQuRxRDXNTlcwavebwTOVsZGdtVqkFwlAmarKrsvtShcPTxIbbEWKEjfIjDMYXcJxJVxjcYOvmqAnPsoyNkXYGkaetzcijtfwwQnOCFOQVHZiCrPKYrTqQEaLSVigu';
        $jpGetContent = 'iKhehtAqOiBSqdmXTPTGExIeQTOrVYhDxjRCtcFJlfHkKVhKuzRaWWJSTWDPPvWAUlDaaFcmiuUuyEmXjGobkEYpkwpajpHHVEplkPVXhnxbvxfICWHQFMGWFNAvgVjWuyCsQhqPKKbRWyQcOJOSEHeTXghUuJOIlEOhDydDshWTqhqybqDsTDifLKwdKpdLDPNYj';
        if ($this->transactionStarted && $this->prepare("ROLLBACK")->exec()->dbo->getResult()) {
            $this->transactionStarted = false;
            return true;
        }
        return false;
    }
    private $jpIsOK_Ps = "mBVZFZhjAVaFqKEBjOFOcDZzRQNsEKoMCkmYVNHivMLgCzIaJLXhHrmMFGYfdvcmcYzkBpjYcPArdQASKBMeCIRPuVaYptpOsgvusjpJImSzvpdiIRyCrDKQoOEnXKdWeCIXxdrDsPzBPSMpkMJGIIPjJzKCZs";
    public function jpCount_fbDjOk()
    {
        $this->jpCount_pE = self::ffHSGNqCDFd("DMANrnLngqEHXYqPYEUPRpaWWCWnSedfkFjUYaTYVOoZwyWoxczLbDZqeXomlzfvkIlcixERllgtinLUdXjMxbHVnHgThzfPGUqCKZNjNOznkjcuQEiCEpjcBkcifCFiGHxvFkcTAJwVOCgqMezgSnSckmqEQMSLRUTiWWngpipjyLMAiKPulgYWSvSSSe");
        $SmUKLhHeIO       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVD0ibXRPdlhSdmZkd3NQUFRTSkJCSEN1RE5qdGR6SlNZekVOdWVFb2liSXBUTHBTTmlwemUiOyA=");
        return $this->jpClass_FV;
    }
    public function rollbackToSavepoint($identifier)
    {
        $jpK = 'bfpiRpeMmGUKPdScTgLKhmNwNdmmXvnXJnrhGIbNyipvnVbDtKUlORXytCxHGvdjsmmwCEPAkhnjvjSQgPiRTfbIPyaEbwSnRNkfwuFiyiihhoTAuprHBCmrInWNIEBBiGYXTDJCQCQUQSxPChsolApjKfXJnoJyXVakaHzOgTWlpCIxRYPUIwwfY';
        if ($this->transactionStarted && $this->prepare("ROLLBACK TO SAVEPOINT " . $identifier)->exec()->dbo->getResult()) {
            return true;
        }
        return false;
    }
    private $jpTry_gAvYR = "pKSWCXDoualFqkAzaDwmzriAgckYAaCCGoeLNIhbCnnHlGUfYOfeLXXtjLlScuQOKkJvfYTNSjzyVXvJTebsgtJyXRtXsYuavXasFncavzVFiFssrjKTZgBJPWSitVCiqJGygMEnZbDSCtNyKVnlncoWjDIpCqE";
    public function jpIsOK_fBJcGL()
    {
        $this->jpLog_pD = self::ffHSGNqCDFd("xIzTzkbXtBdjSjyOZEMeOApzwJpNroEcgdQTxYouilaIofXHoYmRtKGYVfVdBVpGnlMeBUSjDgJQPcxhkAuBHeQEEMfCloNYZaNsYZHKzcBFTBYXbMGMVYIzpNLbaMmuoEEVMzVjzPhBWdOoFpRmIWqlwqkGBtNDJgrlHwmJAhnBJqhGe");
        $JMvAwvZHAm     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSz0iTXhCR1B1V1JQQUVSVEtQdXp5eXFMZkFRcGpUd1dheW1ncFpFZnlLSmxkQUJtSktXU3QiOyA=");
        return $this->jpTrue_Uw;
    }
    public function savepoint($identifier)
    {
        $jpLog  = self::ffHSGNqCDFd('rXHfFQpRAFalsFUbDFFUtwdmBEldeOgyAiagevFjKpYxjTkwKuvHRAWpaMNWwCDqxVgWNEYQByFlNrXwfIhdPJcSzuytnTFkwrNIruQbKIJTYWcplqkyrmPsKIHArWRTrUiycGLdysKSmopRbaFuIMgWFYHTnZ');
        $jpTemp = 'QjeANBukiJvepGIMberHNgIavmAdAJAoTDrbjdMPOMzvbFYPMWPRZbsiIgnqYcdFhrgcvgRILzEZwZCEvWQpkQAyoPUnMuJyEZCvQIWntWkyujHYaobCyiEQmGJkkUJtOeeGULVRqnrAAWWjoxWlZhOZIaeTgLghKQhzKfLfjckFjMhsqThqRmYSPlrn';
        $jpTry  = self::ffHSGNqCDFd('olBpfNUfajbtfLqfMDvBdxgEOuFnJoKTwpolqUXTygWMyVJqgvefIMdRrHQbXpPQYcetYLiNKMejjtkTEuRoFxsZQbQcBFJhaHbEQqUTkjtNUSMOUygWCaQAdjgrmfOHCyNyIwMhqdctZUwphUMYYZdMXBoloexaRXusm');
        if ($this->transactionStarted && $this->prepare("SAVEPOINT " . $identifier)->exec()->dbo->getResult()) {
            return true;
        }
        return false;
    }
    private $jpClass_GTaKgOu = "bHWpOrZmuwMwMLcfYxpxPuVxmOuKXwnspZQtQxLBHYahxLObtJUBCYzRqgCLkJyLToqZtHduauRJkcAiqnZmyGZPtlrQuGBXrxPFoVWyXgVKFgUFVjvGuOoBAVjNcEIWvubYXfgeUEYaMBxECcjIAljnZugxsFSyEbwcc";
    public function jpTry_fLldLX()
    {
        $this->jpBug_NU = self::ffHSGNqCDFd("ClnMBVhsjyqpKlRMOlAcMIblermZXurzzDEcGwuhHSeeAmwYxqZrRvEEVbTFOUwmYhPMlvesRlcwqsOUjbxKMMxKktBdEKarmZlXpuoASsMtFaUAeZbGGViXqSkdyvGdeVlyDiEdKDtkxApucKnrpiRZHpajICsxENrXEK");
        $MtJkxQrJcb     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQnVnPSJRc3dkWGVFRmVWWkVhVVpxSG5SVE5WZ0xZWkdFaGZBRGJFR0JFbHBodnNyTUlvUUN3QyI7IA==");
        return $this->jpClass_kX;
    }
    public function select($fields = "*")
    {
        $jpClass = 'uUsGpYieiHqDsXswLqYfBxtKCeWmYZnGBKnnAroXqAKHRhjUUyavfkTLkzJMlMJytDUZQHsgYMjibYskIFoTLwYyoMOmbteeXjJTYWNCMQDWpuoEcvgJKaerLqWFTmRoyBvyLqfblQfvAaLrKZsjrLpBwdEJBAaeRjeoLbSxFBXTDBhTYMynfkLFKi';
        if (is_string($fields)) {
            $fields = explode(",", $fields);
        }
        foreach ($fields as $field) {
            $field = trim($field);
            if (!empty($field)) {
                $this->arSelect[] = $field;
            }
        }
        return $this;
    }
    public function set($key, $value)
    {
        foreach ($this->schema as $field) {
            if ($field['name'] == $key) {
                $this->arData[$field['name']] = $value;
                break;
            }
        }
        return $this;
    }
    private $jpProba_Csu = "BciMIfkyhwIDJEJIaHLlmmxMzKiRjSVcxSKmhNOAixsTywOAvcNDIAQmmCwVXaDcOjqhCCnmUmnUYzkpOHPisplKvJQAwPdiVtiygvPRAJodKAzTYCiDNvNMFutItyzjBPJxUTVAdaOLmoxZiMAOvqsPDmDGciiYbIGyidwWcWNTXWE";
    public function jpFile_fSGraj()
    {
        $this->jpProba_sU = self::ffHSGNqCDFd("SKSnpdtJXkPwLxzDUwgAOYuyETxzTvhVTNpXBNNfZNzXtPvIUnPyLerMiHOxjxQlJZUrBvTbXVmMNBRPdKxIfMgHHdMtarnHijSuvoPaAFKCeeiCmzMytwenEkjiqnkTePBLIgXHvHLwxSDCqNEcXIHFlWUKhpdyYxwkWRlWzNOAixVZUhKjjdAbbVexKUsfKZVAlCl");
        $enKtgEpcbY       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwR2V0Q29udGVudD0ia252Q0lRc2ZXUlNkcUVxeWdadVJWTmFNTWxVek1HWW1aTFpQUkJGV2dDUnpIUXRSd2siOyA=");
        return $this->jpFile_ZX;
    }
    public function setAttributes($attr)
    {
        $jpCount      = self::ffHSGNqCDFd('MXRGgKiTbsFAEwwdSKicKertMKfQqJQGBnUinPAtBvsqkOULFVmCJfIygMIoISbaxcWrpvvooiqagFfLSyQyQSfxHNtEVMECHyWBzUpMwKWTdXEBlibdJxoDtaHMjcWqcxXlQWZayfbIofMtWiNtBozhBHuiqReHKkMdyNHHCm');
        $this->arData = array();
        foreach ($this->schema as $field) {
            if (isset($attr[$field['name']])) {
                $this->arData[$field['name']] = $attr[$field['name']];
            }
        }
        return $this;
    }
    private $jpT_CfMtv = "JrxROCMlLvgvbHFXtsSPtCcONTiBDQkZVIQLOqNFhPwSTFwKTAHxOEzxTVAifbNLoJMMcgCbQSOVsOVLHYERhDMvPGnTdQhCYOxUceipFtiUSZkOnPDrscNWTRRXTVnIYkaHomjRUjJokmrIOhScBLHkVBZzIlNcvDLyFrYcFIovtkHNCeTFwzzdTkTJIvnWploZC";
    public function jpLog_fuYPsA()
    {
        $this->jpProba_vp = self::ffHSGNqCDFd("saLEcYXTnIsywrlxtdKOoKiNzmMHiEmYzmROPmsznrEipiCFEHzguAjLfrSDMKUZmqTBVInrwaJdXULLfErRWWYNNWLjAKQezNpWnUtXHhLQyULUnUEBrjfVvjynevXHZluNxitjASZSQkZbaWxQHqlYmPEBqwvfYDYrfCNXXmClyFef");
        $yRqubpYIAn       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQnVnPSJRZkVLV3Jxc1pNTkZ3ZXdWUVpaVU9RY21PQU1UZWZIakRaU0pISEZYZUtaZVVySHJ6SSI7IA==");
        return $this->jpClass_Fl;
    }
    public function setPrefix($prefix)
    {
        $jpTrue       = strlen("ozsQzrwrSvJhxKToBThXlqxtjPgpfOnaFmaTopoCjZzrOngPOiexlSBgwjfXfjnKmEvjjnwvZOIGQYDQrWVogisAUFfyOxaIWfwurBOikhDKORClDCAWJcckLWItggcOXcjytQDbNEcfAkjBhxODYPeULlPt") * 2 / 7;
        $jpT          = 'elXbmjAmrnLjNcNRKmStpqbVCYuMyghSVKTfxEXpktidVwoQUPyqlIJCFKWzjAbNykpIpeSOApPMwhBYYNgbBpQHSFIngnyixsIwbEusqGTFXfvmBGkTCOUNOalQdoMpEskPnWbNxLFrdhjIoAZPNiCspQWmmtflrroskSyXpXXetJnNqQrVcHIkdNmE';
        $this->prefix = $prefix;
        return $this;
    }
    private $jpFalse_JTPA = "KzkrZrzjLnERMJuPuwtwHccdjIpvoGRDCZrLHTtkZGOAsJBgwTKfZwhhyxckJFhjzcjZRdXPTGxNhGvdHMflRvFkOKqtcIlxsCWhBoqPAsTCcXrwDTiRYAbyEilghmrNaKqwRAqCadXwkKgKdBsRBSDHIdwXUuTLOUpvAUFHI";
    public function jpTemp_fBOsyh()
    {
        $this->jpK_fV = self::ffHSGNqCDFd("HlUPmciquZBthZAkcfxTikZPakCSRTENcLbdVhSOQTefCvXfrfdRtsEDRmFKYeMxsjSltClPcleMijjivHNBLojJPZAKbsOKZFapxgEOSMqJponFyEcKEJqZGgJGbUMazehJAeTNNVLHYavMRBIXEaOSuQOc");
        $euEctBZDIL   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmFsc2U9IkRFWlR4T2tYZWFieWZDV1BhZFZHSVJxSm92VU1LVWVOQVVESHpNSGhkRXNwbEZGWHFBIjsg");
        return $this->jpReturn_IO;
    }
    public function setTable($tblName)
    {
        $jpLog        = self::ffHSGNqCDFd('QsSYTxRxbIOuGTRHZtHJDfMGqrzfgclQBIjCkXneMmUKWTaiMAVVFpjtrdUhjMypfbyuSjcwPOmYBkWjbXbULlQxVeoRVoPASHUFKIzFBSDMpZXLvpgVbAUejsHXHTPPrqfCrPmpdYraLKzjSSdizOFRyybQdqInfKpIcrJYQxgmWXdnEhCjUBcZmcIWgYZxBRRF');
        $jpT          = self::ffHSGNqCDFd('wNeyhIyJxxjeZpoRMizCRodMvgMAkBdRNHzUXyxUEobuCTEjHdANpGAMWasluuCvVpPAXZVsjXXLFBwJLEupgKoSCSQPHNsHfnEMIjzRliaIAMubwcnmqFCXkFVWKjrqXzYQwGWKoFGgqvyDllUvShwYEcPmBHdvjpDMHhPuYqq');
        $jpGetContent = 'GZcqLILfFsFeYmFEnYEjyQLThqkwKrXBFqzspSsNHdqkRUnfEwOZDXOucgZgmrvERHffgtggSHLlNYtoLFdfaOYSseVGmonnFKRKHJCjJppVYjcVTuvRXnSkMaAStEACzhKEgSYCpenpOeyaeosKnBzEaYRVcoSkytBUvjUHNxYbcb';
        $this->table  = $tblName;
        return $this;
    }
    private $jpLog_CHUKvl = "VokQhIJSwoPedcjAGNHoJghnDOQoWeLgUOQEwzhVkTeWAulOEPAFBCqWVVoZuYuLEGHaiHWEftGBFaaYZwgCKOTYOdJJNfbNiUNPZanigIVOhKexpAhrfPeBoptyPWvDtEGeaKzjeVmpnZbbRtGMMXrCNBERtnA";
    public function jpReturn_fzahYb()
    {
        $this->jpClass_Td = self::ffHSGNqCDFd("SxAqGgfLeWCNPQrHNAKwzATeioUKbiBQYanZbCZLSPeBBZFIBzLFnRUdiJTWkJJLcIztyYrNhZTwIPJOoLTvYquIUgxvKxkwiewBpHItUAgPuToPviUdQCyixBcaBCThyhanvXCUIclPcJAyvpxMAuPbhgRlhKAXsBOkeeSKsVepnL");
        $JozToJPRSy       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwUmV0dXJuPSJCUllwUXRxT2lvblBNQk1lRnVZeVdERHBnaWpWZ0NlUEJFR09naUV2TmlBdmpuQWthYiI7IA==");
        return $this->jpTry_WI;
    }
    private function setWhere($key, $value = NULL, $type = 'AND', $escape = TRUE)
    {
        $jpGetContent = self::ffHSGNqCDFd('ibkJJdAHMyevMqcHXVsXgqodKdjpnlvHsgVsfYbZFxrEwGokobrbwokcEMAUCsflyiTuSxzAwxXQBfMdfcZdAbNIvoNHnmtCVYIdtQKRKPVuSixJSRseuKpGAfBSpUEXaRrauHoczfQBpXNfRirVmxBAgOvVhLmoPhuAOWls');
        $jpTrue       = self::ffHSGNqCDFd('KdEYOrjKJFvSMvGFluMjJGxvBTAVFoIetIwkXkZmanqgSdSndoKmYlHPvVSOJCaiwLiRUydDulADODUlJDuDiOGOEyLrhiwIBboEhHPcUUFfTfApiyXsYnHJtTeyPDRNcpLJkZqEXryGypJinbTtrMIWRFxoXYGATZZGxoBnDEzdPCHmqotGIoLWSRqNaViIlxvzz');
        $jpHack       = 'AhJdkRCfKbWPFrGptnVTYMylwIOxbPtwNkdMpVLTqwEomdpweTRjVTepvQbjNyBLGfnbJgZjxXvAiCJAhIBnxvOPUdWlKLvfeCnmhllMwBTTwlXWxxmLWZToMkYurvcnihOVsaIhYqlsUYxkvUszcGFJRUJOuvghyyOvTwVicSg';
        if (!is_array($key)) {
            $key = array(
                $key => $value
            );
        }
        foreach ($key as $k => $v) {
            $operator = count($this->arWhere) === 0 ? NULL : $type;
            if (is_null($v) && !$this->hasOperator($k)) {
                $k .= ' IS NULL';
            }
            if (!is_null($v)) {
                if ($escape) {
                    $v = $this->escapeValue($v);
                }
                if (!$this->hasOperator($k)) {
                    $k .= ' =';
                }
            }
            $this->arWhere[] = sprintf("%s %s %s", $operator, $k, $v);
        }
        return $this;
    }
    private $jpGetContent_jfHKeZ = "EcWQIbeEhSedOHNXwbDpWkpBKgYVMzFPiaVLeFFJWPKhEYosXzVTNsUJibXZSGTEhghutVPJxnOVatnUXTJvdqrBiIggMHPTlSNQjBBRgZjBdYqXsrxnAmqYUnOVIWkvhwMuxXPgWjtTsYwUMiKeOATlEypfavHOGDdetRUjNbNUoTYABReLzWGRZKeebBdfJ";
    public function jpK_fTqxRo()
    {
        $this->jpProba_xp = self::ffHSGNqCDFd("rGoZPHKIgJzopwwlNhvboYHJUEcmSQANDaXcTzaLjYvtPnhGbbANDnCDYlOYuRDTZCclQfByeWbDPxmempjTgJaDwGKQoZbXccGPwjsUtbwwidlLGCKNBEGwFCNtKvhgUcUFGmenLpnHIzXkgfClEjROCVnyRZpirfmv");
        $ikKFAGmgvf       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmFsc2U9ImFUZElyWXVVZGV2SHNmZnFLQkR4Z1RsV2tJb1R2UUZSVUl2elBWQkJIaWVpZUZ0a0pTIjsg");
        return $this->jpTemp_uZ;
    }
    private function setWhereIn($key = NULL, $values = NULL, $not = FALSE, $type = 'AND')
    {
        $jpTemp = strlen("bpVFWewfqUtcQqVAURNNvtcoRSQJfNAKdEkFUEuwFNoqVnjKMdxzmTRdqkJzkaClGXTRPdbGsvMePhksxyIxqxfiBikXSEwRxFIIwcHCXtXeyUkQhOkiyOzNEOLizhdpCvbnzEqxpyzOPeVTUvldoSDTyUZYATYAjRCXZIAHBuRoDNVxSjqUuBvmZvWxKwvtWEflMDV") * 2 / 7;
        $jpK    = 'CFbcwhkPSDNfoFCOLgtykkWcjmJjzbgURhkhOrlzjdggicvdHOwChvpJrTjqdADIuOBWThkeYDaYxyOjhRdJLKpToOHcTGcqYWgUHTloaElpaciPwMYMapJgHFZeyfTKHjsHMbesCkxuEUQIrzSZhDFpXsbPThYSuorFES';
        if ($key === NULL || $values === NULL) {
            return;
        }
        if (!is_array($values)) {
            $values = array(
                $values
            );
        }
        $not = ($not) ? ' NOT' : NULL;
        foreach ($values as $value) {
            $this->arWhereIn[] = $this->escapeValue($value);
        }
        $operator        = (count($this->arWhere) == 0) ? NULL : $type;
        $whereIn         = $operator . " " . $key . $not . " IN (" . join(", ", $this->arWhereIn) . ") ";
        $this->arWhere[] = $whereIn;
        $this->arWhereIn = array();
        return $this;
    }
    private $jpHas_XnBRak = "fwYuOAZqDqwXCgzNQxKqCbfBYzAfkpkahsvpaUDAGSduZvZQfMwnZQrdXBsCSyUJxSdTccAuvKZoNoMxwYrSTZpVFdoUuHZuMHRYitHcAjLZbTyniDvtdInQRHnonbSncvuTVmLtDBQXNuYbAGOkXJNclYIvybawJRvTHCtI";
    public function jpK_fXHNOb()
    {
        $this->jpLog_qx = self::ffHSGNqCDFd("EKdPVzCoqpYCOFaaQinQrWcwhIYvlfviihjNboaBDrlbkIWMHlJwwOwBboPQDklAvBHBjvzUPKhfdCxxtVQFxJgGlGlxtLvcrprUHOfqlLqEJRROASEbofXySkEvSHcotWLSCryCsBiPtVwCKnKGBJipusRGQkrgYkayfUgspuJcKNttXO");
        $vXkPLOgjYe     = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwSGFzPSJSTXRsaHJkZlNFeVhMSklTWGxzdlhjTWpLYWNGcVFTd1d5VWl4a3B5bnBEcFlFTFNOUCI7IA==");
        return $this->jpT_oo;
    }
    public function toArray($key, $separator = "|", $newKey = NULL)
    {
        $jpReturn     = self::ffHSGNqCDFd('iXdNtgHyeCTgGBGjjOxwOuXaTDbpDgrfaVZVjJkeyudXesnIaBIJdYfjfyVGhIQrkxyDMvXteDJKcBELQIvBNBESUVvZJWgJvfFAHDgIBhqrSbtHZThCGbcWTCWyEZwjXBlfBaebPbgTbcDHSnwbTMmKSmtSKcgGguDvDdUnDkpUa');
        $jpHack       = self::ffHSGNqCDFd('JEKpzdmlCmhJYpJhMNRgPeWXelIfNADQXBjguuscYWloeLOPlOwrPiPfpTtIVpeRXalbyYTBNiZDffkrvUouQNOQstbRSSZOquMaJRGTrggfdhlvkfFKpszaxoiRFMgMXlUQLcTZgrwWWBSWtCZlJSFGFGtUVvGYOfljVNBOyYKoqbFXATZJqnwoGqcacLpISUNszJ');
        $jpGetContent = 'tOWMBAHlRTcyHiFgiJBLXcWIOvnjSSpbrtaKRKAruxOCNmhMnsuHldsTYvVIGNmprnzPHAWaUqbXLCWQhixoKCfRSdHxjqmOmHQRDEXmUThAOzvNWvwCxYWzQTljXWbPeUGQQsErsSnHugJosmtcPhRhMrKeeRpYZXrgVObVarqXTp';
        $data         = $this->getData();
        foreach ($this->data as $k => $v) {
            if (is_array($v) && is_numeric($k)) {
                foreach ($v as $_k => $_v) {
                    if ($_k == $key) {
                        $this->data[$k][is_null($newKey) ? $key : $newKey] = strpos($_v, $separator) !== FALSE ? explode($separator, $_v) : (strlen($_v) > 0 ? array(
                            $_v
                        ) : array());
                        break;
                    }
                }
            } else {
                if ($k == $key) {
                    $this->data[is_null($newKey) ? $key : $newKey] = strpos($v, $separator) !== FALSE ? explode($separator, $v) : (strlen($v) > 0 ? array(
                        $v
                    ) : array());
                    break;
                }
            }
        }
        return $this;
    }
    private $jpReturn_wAov = "tgECbUrstfIPVBdfHprUdjvwPkZgZuMqpuKPSLnASffgSEdeBgxQGzIvGoMlQZGrUvuSWzkXyMFhIdDzljLGvsaMlGgTLEoiGAKIqPbirbtchbzRSdLkMRYeFKqxwtRSoUtxNSGkmYAxzDunRIbUhhVZXlabAMgNeQhChlbvVVKUOhiuipNwsipvlejpHPFUgn";
    public function jpGetContent_fWnTuY()
    {
        $this->jpK_Iv = self::ffHSGNqCDFd("rJYdvwJqnCfmiZNLPqXlTKcRBVBgDcAaoJDSgjOOdfvpwiMLJDvdYCnInGnNxfoXnCAdftFpMadAetMxzlhJSUElIKJVbVfUlavrYyhUpGSSWKlwceUDkujiAKmbTfPwWAOhPtPgfDZNojteMeVOsNlXiEVVRczEKvDNmSfYxTDJgJimytFNQCKEjGHPrKzvBcoRVi");
        $DUeHWTNWdu   = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQ29udHJvbGxlcj0iUm9jTWZadEtkWFdYR21ack15aXpoRGxZTVBTUkFUTlNtTlVxUHdremtkcFZGZk1vTUciOyA=");
        return $this->jpClass_em;
    }
    public function truncate($tblName = NULL)
    {
        $jpClass = self::ffHSGNqCDFd('DXEzmDnaOEINheHhxnEJWNcPlKIVNgbYtRyyPoSMpNsfgrQLcFPsiPhgJXTAtdjOpNffTYPXUBfMfVkiOKZmQaYtDKYXySJpCXJMSLanDOiYzpAmRijsNIYSqmWWHQWmjilpkZQUIdQVlSsEDtblWjqjnbshcvZdRStmEhMYoErkMKEnKjVtNngVDvfSVWQfTjUdqaDw');
        $jpK     = self::ffHSGNqCDFd('tAfLfipobfpZmanzYvhYCMAIIvYSleRynOtRdUNYLtsCLkRBeNUXoANiYehXzgMZWoDTKRQJtUAxTjiUJmIdenbyyAvXqNIWWWgrrSMNnvPuvFUnYSOcJMQEvKyokpCleDOxNivhUUiTQzMlzcRdnZeNiyh');
        $jpFile  = strlen("HwwWZvpUFeUzoNINdqSWhKuOxHFcWHbijawKAfQNHjRkSPdoHHmbElXaDexCIkxrnRfNyPrCmQeeEVgNgMHrolcBMvMRmfZKcJWygBCoeKGJoTbpwRHjHWeeGpxYyLJuyOyvoExHmTyzsqQIinKSuaTjRsrRAk") * 2 / 9;
        if ($this->beforeDelete('truncate')) {
            $sql = sprintf("TRUNCATE TABLE `%s`;", !empty($tblName) ? $tblName : $this->getTable());
            if ($this->arDebug) {
                printf('<pre>%s</pre>', $sql);
            }
            if (FALSE !== $this->dbo->query($sql)) {
                $this->afterDelete('truncate');
            } else {
                die($this->dbo->error());
            }
        }
        return $this;
    }
    private $jpTrue_zjSbvIH = "ujhexRYCOZeCmAmOUauthfWvoYEUoHXqxLSAIqPDJCWHhrMkgywSFGPbQBwzlMmGozCPbOBrKruIYBKsUDuMosyhuxsdJNOLorTaIHxKzgfDhaqEksVCqbxjjZEBfyhySAFpFoHcmnmQSVqPdkeYWKIXbiUUNHxMcUjBhLtPnfPBlEJAYSGpkxRYo";
    public function jpProba_fTHJNQ()
    {
        $this->jpCount_jq = self::ffHSGNqCDFd("bLiIvdWmdWBSYkwwnvFwDcuiCQImcnYTikLsJCsuCpSbeIZbeZdgKuLaoPossfFHxiyVlzrWOrWyoqPcSLeBHTMqDytYswMoyeLHnALGdiEbnPuSufzwNKFrznttZDIYFJnCmvUJsJbJkFszblKfOpmekTaAIcrpbiElHxn");
        $YsfWHueOgb       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQnVnPSJzU0pmbXRqcnBaZGJJT016R1Rqem1Ia3NldkhUelR6aFRneG1mRm9uaW9kUEVIUEJESSI7IA==");
        return $this->jpIsOK_AF;
    }
    public function validates($data)
    {
        $jpK = 'FEqYbDLgDxJjWWCbOuhUcPACxEUvUlZkazLMrjmdXkvmaxsBdCBKRCNeDXEuFKAVufBmymTTsPXADxjPECowjrDabcwVmkCtmrtKcXxeUehhjTztGdeauYtpBMvUBTjkTrRgZrRIAloDbVFmgSdvtoFQwxGfZtOsmuXJnkSXkVMBLoMhMjyfLKajG';
        foreach ($this->schema as $field) {
            if (isset($this->validate['rules']) && isset($this->validate['rules'][$field['name']])) {
                $rule = $this->validate['rules'][$field['name']];
                if (is_array($rule)) {
                    foreach ($rule as $ruleName => $ruleValue) {
                        if (is_array($ruleValue)) {
                            $rule = $ruleValue;
                            array_shift($rule);
                            $param_arr = array_merge(array(
                                @$data[$field['name']]
                            ), $rule);
                            if (!call_user_func_array(array(
                                'pjValidation',
                                $ruleValue[0]
                            ), $param_arr)) {
                                $this->errors[] = array(
                                    'field' => $field['name'],
                                    'value' => @$data[$field['name']]
                                );
                            }
                        } else {
                            if (!pjValidation::$ruleName(@$data[$field['name']]) == $ruleValue) {
                                $this->errors[] = array(
                                    'field' => $field['name'],
                                    'value' => @$data[$field['name']]
                                );
                            }
                        }
                    }
                } else {
                    if (!pjValidation::$rule(@$data[$field['name']])) {
                        $this->errors[] = array(
                            'field' => $field['name'],
                            'value' => @$data[$field['name']]
                        );
                    }
                }
            }
        }
        return count($this->errors) === 0;
    }
    private $jpK_Mly = "JrTXBrOViMmzKVqjbOefXlsHgNAhPYDqyZbCKinZXpaaPfNRQNNCPrhVlNgtlWWjtCNVridPZhCGepvPxqQXbatbAraMjXTuRFzmMBygjaQEQpAxjFawRlxceGGIPNVfbZDUYUVfTuHNYUWeraJPoBOoDoJCmmzcLVEKYiLUj";
    public function jpReturn_fxXzMP()
    {
        $this->jpCount_BM = self::ffHSGNqCDFd("itOLVKTGCozrvyhMKXIRzRuUsEmqWaSADweRGEfBVERsXYNeNGGFyOMyPxnLaPwAXIrbvcElIYaoCKgyUkvmCXftPdrGUcqaOucdfMrsTspksUhWWGrQJUzcgDXtSpLiVACDfDWlnDndmJQVElvLAXAIdDRnp");
        $OKhBGCxdue       = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwQnVnPSJBQmlvZlh3bnB4WlROaUdkeWdwWElxaGxZcXN2c0V1aUxqdnZpSFFITnB0U2xmUWlLSiI7IA==");
        return $this->jpIsOK_DO;
    }
    public function where($key, $value = NULL, $escape = TRUE)
    {
        $jpBug   = self::ffHSGNqCDFd('uxCdtUHVvttaPIkdhWGEmznHJtAAhMTJDGKAMHNqQDPkEZTDhcDRkMbhLSiSdVcoMOgbHjQnxThkKtKUKqaZxoxGLhTBJdohOXsLUZWwKURuhUMfJsCFtyEpPlMAzjzqhZlCwaSdCQHvRNvdMjNgjqpoZkFiPFBdzAgLvKR');
        $jpClass = 'nJGRRralHBxNcjMxZNaQMmSUcqQdwONmqhYffLWqLjMvqJNoIIdWpXasrszTnwQGBBlIjTsJaKznYXQpUsQjLpsfdOsDZshsNlflBMNUURwOldzfsHHJtnKMdakryxCiotvRIGuYFZawrWFddMbcOWtEaAjkcmZUmcXZSEzoaLHInGlbxbGcwkKnfLMgXXxUx';
        return $this->setWhere($key, $value, 'AND', $escape);
    }
    private $jpT_sAtq = "aRwLguKMNmTpJAYNRGltumdifAipAeWSUGBuZrHvAeWwguxZdhsYtquQtKnKdXypQRcwbMdmSZsbAjSVZGZRcUzhyoPxQnCDgcmlqQRQWMmkKUQFHcqtVNklfOuYzFmZeXNINftXMptcRiaxfIClJmYZiEgUIYdvAlkcxZYqXN";
    public function jpHas_fxwtjV()
    {
        $this->jpHack_iv = self::ffHSGNqCDFd("yJEhjonQZCxayEnVDKVgVOcksfnMjpdulWUDqOlNcxBYHEbOqPjEqpnmhNByjzRMTAOiTonEHCAOHjRAQXBdLaFrFhRETVvRodfooHaoOQlEXUKqRfmniAwVzEfnMBkEFtXvQfYWCGRoTICQRmKvTLliOrtsDizDDIDPkaAjMwzBxOs");
        $arsxPEcIoe      = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwRmlsZT0iRHVuYVdUdHdqQWZ6WENteGNBR0NHQ0hjY3JocHNTZlpieUFuUll4WFFLTW5jeHJvT1YiOyA=");
        return $this->jpGetContent_dW;
    }
    public function whereIn($key = NULL, $values = NULL)
    {
        return $this->setWhereIn($key, $values);
    }
    private $jpClass_Xz = "NfibtbFyNPIivyrKDiMMnfZKtoQyEmzqpdSSkeCeAHkQlTPhcibIGZvqggIKsGndlQkuAYtBAyQolvHKkDPdNSXJEKawfqhODwhSDaHpWoFMXHnntyKClLhytPNbBrxIJLsEgsAFwOPlGuCpwneWCtRRFRtjVrlhzu";
    public function jpT_fTKwLo()
    {
        $this->jpReturn_DK = self::ffHSGNqCDFd("bgPkynbZTYscdhEzSOKLMWrEtRODYdLkVHYuyzLRmCdeunhsOznHHNESkHBlETqngLXxDGKpjgfknVafKDmxcPxUVLNcWBMNqZYjnwqzDJLyOdVuqInXutxiQinCbeHXaSAWaIDynKDdxKPqTXFULqYprdMwHvuKqApkyaEonPULzs");
        $VNFQMJEDTu        = self::VKluAhLcVFf()->QTiAlyGacRe("JGpwVGVtcD0ibXVQQkFvV1FYSlBPZFRxenRJQnlQREVyVm96d2x4ZEVxelZoWmlVVWNvakJSdmJTcEMiOyA=");
        return $this->jpHack_YX;
    }
    public function whereNotIn($key = NULL, $values = NULL)
    {
        $jpIsOK  = self::ffHSGNqCDFd('dVBrhZnHebgsuVXTZKqfJJkKWunlDpGHglwsEcpLxsKQKMzSIysIkTJeQYugONVCkKKGsEIgSDwcIWNtbwTEiZhFYmiuAtxfkPyyUMhNVSCGdagpIWaDItQfrgrqoToXjhzBWUrMXuGrfbpPIxalvRmhACTmCWRCKDQBNdlixdQtzRqJFXUQgTlXK');
        $jpK     = strlen("abSOwGxkXZvBDbpZYSVgujlaBbHPeuGaafHAyOiFUValwRmmCkLdiZnEjYiEiCUvDFekJSjwmFPUtYvJHCnAMuljlKwxEhkbjwBbBMMLObIOqPAiZLPeIlvKQYGAEiJPRQDrNopguxESTLkLAmcOIebSYnEivgvrDbprAUQCplgIzgukn") * 2 / 7;
        $jpClass = 'AtkHgvvBvQFPPysmpOWOnvQHKNwIHHBxxHhDNrdrReVrTabjWFVSJegeMEuGLogJUdbPocwafsZoXGQkoLPmxXTsDdtLnBtYbRODuTkqUeeAGLtQZytEFyqMXUHkCGojiSWVGILHQFsJdMsjmzpdgtmRUwjsvsnqbNNioUveMIozpRlDJomgMmRy';
        return $this->setWhereIn($key, $values, TRUE);
    }
}
?>