use Test::More tests => 3;
use File::XDG;

my $xdg = File::XDG->new(name => 'test');

{
    local $ENV{HOME} = '/home/test';
    local $ENV{XDG_CONFIG_HOME};
    ok($xdg->config_home eq '/home/test/.config/test', 'user-specific app configuration');
    local $ENV{XDG_DATA_HOME};
    ok($xdg->data_home eq '/home/test/.local/share/test', 'user-specific app data');
    local $ENV{XDG_CACHE_HOME};
    ok($xdg->cache_home eq '/home/test/.cache/test', 'user-specific app cache');
}
