require 'sinatra'

get '/' do
    erb :home
end

__END__
@@home
<!doctype html>
<html lang="en">
    <head>
        <title>Songs By Sinatra</title>
        <meta charset="utf-8">
    </head>
    <body>
        <header>
            <h1>Songs By Sinatra</h1>
            <nav>
                <ul>
                    <li><a href="/" title="Home">Home</a></li>
                    <li><a href="/about" title="About">About</a></li>
                    <li><a href="/contact" title="Contact">Contact</a></li>
                </ul>
            </nav>
        </header>
        <section>
            <p>
                Welcome to this website all about the songs of the great
                Frank Sinatra
            </p>
        </section>
    </body>
</html>