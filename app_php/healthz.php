<?php

require __DIR__ . '/vendor/autoload.php';

class AppServiceProvider extends Illuminate\Support\ServiceProvider
{
        public function register()
        {
                $this->app->bind(Gentux\Healthz\Healthz::class, function () {
                        $env = new Gentux\Healthz\Checks\General\EnvHealthCheck();
                        $db = new Gentux\Healthz\Checks\Laravel\DatabaseHealthCheck();
                        $db->setConnection("non-default");

                        return new Gentux\Healthz\Healthz([$env, $db]);
                });
        }
}

$memcached = (new Gentux\Healthz\Checks\General\MemcachedHealthCheck())->addServer("127.0.0.1");
$healthz = new Gentux\Healthz\Healthz([$memcached]);

?>
