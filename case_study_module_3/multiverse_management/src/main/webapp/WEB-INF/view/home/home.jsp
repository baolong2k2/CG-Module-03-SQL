<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spacex redesign</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap');

        :root {
            --primary: #1E1E1E;
            --dark: #121212;
            --pure: #ffffff;
            --gray: #1d1d1d;
            --mild: #b9b8b8;
        }

        .container {
            width: 1460px;
            max-width: 90%;
            margin: 0 auto;
        }

        .btn {
            padding: 8px 30px;
            border: 1px solid transparent;
            border-radius: 50px;
            outline: none;
            cursor: pointer;
            font-size: 16px;
            transition: all .5s ease-in-out;
        }

        .btn-primary {
            color: var(--dark);
            background: var(--pure);
        }

        .btn-primary:hover {
            background: transparent;
            color: var(--pure);
            border-color: var(--pure);
        }

        .btn-secondary {
            background: transparent;
            color: var(--pure);
            border-color: var(--pure);
        }

        .btn-secondary:hover {
            background: var(--pure);
            color: var(--dark);
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            -webkit-font-smoothing: antialiased;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            color: var(--pure);
            background: var(--primary);
        }

        header {
            background: linear-gradient(135deg, rgba(0, 0, 0, 1), rgba(0, 0, 0, 0.2)),
            url('https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/sunrise.jpg?alt=media&token=34f792d5-c058-40e7-86cf-a62b13cf7be0');
            min-height: 100vh;
            background-size: cover;
        }

        header nav {
            padding: 20px 40px 20px 100px;
            display: grid;
            grid-template-columns: 1fr 2fr;
            align-items: center;
            border-bottom: 1px solid var(--gray);
        }

        header nav .nav-right {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header nav .nav-right a {
            text-decoration: none;
            color: var(--pure);
            margin-right: 30px;
            position: relative;
        }

        header nav .nav-right a:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -30px;
            width: 0;
            height: 2px;
            background: var(--pure);
            transition: width .3s ease-in-out;
        }

        header nav .nav-right a:hover:after {
            width: 70%;
        }

        header nav .nav-right a.active:after {
            width: 70%;
        }

        header nav .nav-right .search > div {
            background: var(--dark);
            display: flex;
            align-items: center;
            padding: 10px 15px;
            border-radius: 50px;
        }

        header nav .nav-right .search > div input {
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #fff;
        }

        header nav .nav-right .search > div img {
            padding-right: 16px;
        }

        .social div {
            border: 2px solid var(--pure);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
            opacity: 0;
        }

        @keyframes moveIn {
            from {
                transform: translateX(-100px);
            }
            to {
                transform: translateX(0px);
                opacity: 1;
            }
        }

        .social svg path {
            fill: var(--pure);
        }

        .social div:hover svg path {
            fill: var(--dark);
            transition: all .5s ease-in-out;
        }

        .social div:hover {
            background: var(--pure);
        }

        .hero {
            position: relative;
        }

        .social {
            position: absolute;
            left: 0;
            top: 0;
            border-right: 1px solid var(--gray);
            width: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            min-height: 90vh;
        }

        .hero .cta {
            display: flex;
            align-items: center;
            justify-content: space-between;
            min-height: calc(100vh - 80px);
        }

        .hero .cta h1 {
            font-weight: 400;
            font-size: 22px;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .hero .cta > div {
            flex: 1;
        }

        .hero .cta .left-section {
            padding: 0 60px 0 30px;
        }

        .hero .cta .right-section img {
            height: 70vh;
            transform: rotate(20deg);
            animation: moveInSpace 12s ease-in-out infinite alternate;
        }

        @keyframes moveInSpace {
            50% {
                transform: translateY(100px) rotate(-30deg) scale(0.8);
            }
        }

        section.strip {
            display: flex;
            align-items: center;
            justify-content: space-around;
            background: var(--dark);
            padding: 50px 0;
        }

        section.rocket {
            display: grid;
            grid-template-columns: 1fr 100px 1fr;
            grid-gap: 80px;
            padding: 100px 0;
        }

        section.rocket .rocket-body {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        section.rocket .rocket-body span {
            font-size: 0;
            position: relative;
        }

        section.rocket .rocket-body span img {
            width: 100%;
        }

        section.rocket .block {
            width: 70%;
        }

        section.rocket .block h1 {
            font-size: 32px;
            font-weight: 400;
        }

        section.rocket .block .with-underline {
            position: relative;
            margin-bottom: 38px;
        }

        section.rocket .block .with-underline:before {
            content: "";
            position: absolute;
            left: 0;
            bottom: -12px;
            display: block;
            width: 38%;
            height: 2px;
            background: var(--pure);
        }

        section.rocket .block h1.with-underline:before {
            width: 20%;
        }

        section.rocket p {
            line-height: 1.6;
        }

        section.rocket .block h2 {
            font-weight: 400;
            margin-bottom: 20px;
        }

        section.rocket .block.payload {
            padding-top: 130px;
        }

        section.rocket .block.payload h2 {
            padding-left: 80px;
        }

        section.rocket .block.dragon {
            padding-top: 120px;
        }

        section.rocket .block button {
            margin-top: 30px;
        }

        section.rocket .block.composite {
            padding-top: 60px;
        }

        section.rocket .block.first-stage {
            padding-top: 60px;
        }

        section.rocket .block.capacity {
            display: flex;
            align-items: center;
            padding-top: 40px;
        }

        section.rocket .block.capacity > div:first-child {
            margin-right: 40px;
        }

        section.rocket .block.capacity h4 {
            font-size: 12px;
            font-weight: 400;
            margin-bottom: 20px;
        }

        section.rocket .block.capacity h6 {
            font-size: 40px;
            font-weight: 400;
        }

        section.rocket .block.capacity h6 small {
            font-size: 12px;
        }

        section.rocket .block.second-stage {
            padding-top: 60px;
        }

        section.rocket .right-block .block.capacity {
            padding-top: 120px;
        }

        section.rocket .right-block .block.capacity.single {
            padding-top: 40px;
        }

        section.rocket .right-block .block.engines {
            display: flex;
            justify-content: center;
            padding-top: 40px;
        }

        section.rocket .right-block .block.engines img {
            width: 180px;
        }

        section.rocket .right-block .block.marine {
            padding-top: 100px;
            wodth: 70%;
        }

        section.rocket .right-block .block.marine h2 {
            font-size: 14px;
            padding-left: 100px;
            margin-bottom: 26px;
        }

        section.rocket .right-block .floating-graphics {
            position: sticky;
            float: right;
            top: 60px;
            margin-right: -80px;
        }

        section.rocket .right-block .floating-graphics img {
            height: 350px;
        }

        section.rocket .rocket-body span:after, section.rocket .rocket-body span:nth-child(3):before {
            content: '';
            display: block;
            position: absolute;
            width: 0;
            height: 2px;
            background: var(--pure);
            transition: width 1s ease-in-out;
        }

        section.rocket .rocket-body span:nth-child(1):after {
            bottom: 16px;
            left: 96%;
        }

        section.rocket .rocket-body span:nth-child(2):after {
            bottom: 62%;
            right: 100%;
        }

        section.rocket .rocket-body span:nth-child(3):after {
            bottom: 64%;
            right: 90%;
        }

        section.rocket .rocket-body span:nth-child(3):before {
            bottom: 36%;
            left: 90%;
        }

        section.rocket .rocket-body span.active:nth-child(1):after {
            width: 120px;
        }

        section.rocket .rocket-body span.active:nth-child(2):after {
            width: 180px;
        }

        section.rocket .rocket-body span.active:nth-child(3):after {
            width: 200px;
        }

        section.rocket .rocket-body span.active:nth-child(3):before {
            width: 160px;
        }

        @keyframes jump {
            50% {
                transform: translateY(-50px);
            }
        }

        section.rocket .rocket-body span.active:nth-child(1) {
            animation: jump 1s ease-in-out forwards;
        }

        footer {
            background: var(--dark);
            padding: 60px 0;
        }

        footer > div {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
        }

        footer .copyright span {
            font-size: 12px;
            display: inline-block;
            margin-top: 5px;
        }

        footer .copyright img {
            height: 30px;
        }

        footer h1 {
            font-size: 18px;
            position: relative;
            margin-bottom: 30px;
        }

        footer h1:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -8px;
            display: block;
            width: 60px;
            height: 2px;
            background: var(--pure);
        }

        footer ul {
            list-style-type: none;
        }

        footer ul li:nth-child(even) {
            margin: 10px 0;
        }

        footer ul li a {
            color: var(--mild);
            text-decoration: none;
            font-size: 14px;
            transition: all .3s ease-in-out;
        }

        footer ul li a:hover {
            color: var(--pure);
        }

        footer .footer-socials a {
            margin-right: 20px;
            font-size: 22px;
            color: var(--mild);
        }

        footer .footer-socials a:hover {
            color: var(--pure);
        }


    </style>

</head>
<body>
<header>
    <nav>
        <div class="brand">
            <a href="#">
                <img src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/logo.png?alt=media&token=52035215-f78b-46fd-b8ce-8e6ae93c01b6"
                     alt="">
            </a>
        </div>
        <div class="nav-right">
            <div class="nav-links">
                <a href="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/A-World-Without-Danger-Code-Lyoko.mp3?alt=media&token=8089dece-682e-4cbc-84e0-248ef3212630 "
                   class="active">Music</a>
                <a href="https://vi.wikipedia.org/wiki/%C4%90a_v%C5%A9_tr%E1%BB%A5">About</a>
                <a href="https://www.spacex.com/vehicles/starship/">Updates</a>
                <a href="https://www.spacex.com/human-spaceflight/">Career</a>
                <a href="https://shop.spacex.com/">Shop</a>
            </div>
            <div class="search">
                <div>
                    <img src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/search.png?alt=media&token=9ba1e2c1-22d7-445b-80f2-e623dc802c18"
                         alt="">
                    <input type="text" placeholder="Search">
                </div>
            </div>
        </div>


    </nav>
    <section class="hero">
        <div class="social">
            <div><a href="https://www.facebook.com/spacextechnologies"><i class="fab fa-facebook-f"></i></a></div>
            <div><a href="https://www.tumblr.com/search/spaceX"><i class="fab fa-tumblr"></i></a></div>
            <div><a href="https://www.instagram.com/spacex/"><i class="fab fa-instagram"></i></a></div>
            <div><a href="https://www.youtube.com/@SpaceX"><i class="fab fa-youtube"></i></a></div>
        </div>
        <div class="cta container">
            <div class="left-section">
                <h1>The multiverse is the hypothetical set of all universes. Together, these universes are presumed to
                    comprise everything that exists: the entirety of space, time, matter, energy, information, and the
                    physical laws and constants that describe them.</h1>
                <form method="get" action="/interface">
                    <button class="btn btn-primary">Explore Multiverse</button>
                    >
                </form>
            </div>
            <div class="right-section">
                <img src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/astronaut.png?alt=media&token=581e5fb6-6edb-4e91-8255-56e4b7473119"
                     alt="astronaut">
            </div>
        </div>
    </section>
</header>


<section class="strip">
    <h3>Starlink Mission</h3>
    <a href="/login" class="btn btn-primary">Obey me or you will die</a>
</section>

<section class="rocket container">
    <div class="left-block">
        <div class="block">
            <h1 class="with-underline">FALCON9</h1>
            <p>Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe
                transport of satellites and the Dragon spacecraft into orbit</p>
        </div>
        <div class="block dragon">
            <h2 class="with-underline">DRAGON SPACECRAFT</h2>
            <p>Dragon carries cargo in the spacecraft’s pressurized capsule and unpressurized trunk, which can also
                accommodate secondary payloads. In the future, Dragon will carry astronauts in the pressurized
                capsule as well.</p>
            <button class="btn btn-secondary">LEARN MORE</button>
        </div>
        <div class="block composite">
            <h2 class="with-underline">COMPOSITE FAIRING</h2>
            <p>The payload fairing is for the delivery of satellites to destinations in low Earth orbit (LEO),
                geosynchronous transfer orbit (GTO) and beyond.</p>
            <button class="btn btn-secondary">LEARN MORE</button>
        </div>
        <div class="block first-stage">
            <h2 class="with-underline">FIRST STAGE</h2>
            <p>Falcon 9’s first stage incorporates nine Merlin engines and aluminum-lithium alloy tanks containing
                liquid oxygen and rocket-grade kerosene (RP-1) propellant.</p>
            <button class="btn btn-secondary">LEARN MORE</button>
        </div>
        <div class="block capacity">
            <div>
                <h4 class="with-underline">ENGINE</h4>
                <h6>9</h6>
            </div>
            <div>
                <h4 class="with-underline">BURNTIME</h4>
                <h6>162 <small>SEC</small></h6>
            </div>
        </div>
        <div class="block capacity">
            <div>
                <h4 class="with-underline">Thrust At Sea Level</h4>
                <h6>7,607kN1</h6>
            </div>
        </div>
    </div>
    <div class="rocket-body">
        <span class="first"><img
                src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/rocket1.png?alt=media&token=14a5bc18-bed8-4e05-ab27-ea2582385110"
                alt=""></span>
        <span class="second"><img
                src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/rocket2.png?alt=media&token=e384ad41-0564-4f3a-91e1-159fa463563f"
                alt=""></span>
        <span class="third"><img
                src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/rocket3.png?alt=media&token=2eade371-c861-44e5-bf3c-d4f302962bf7"
                alt=""></span>
    </div>
    <div class="right-block">
        <div class="floating-graphics">
            <img src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/bus.png?alt=media&token=82aa6dd0-b71f-42f6-8bda-dac577c15328"
                 alt="">
        </div>
        <div class="block payload">
            <h2>PAYLOAD</h2>
            <p>Falcon 9 delivers payloads to space aboard the Dragon spacecraft or inside a composite fairing.</p>
        </div>
        <div class="block second-stage">
            <h2 class="with-underline">SECOND STAGE</h2>
            <p>The second stage, powered by a single Merlin vacuum engine, delivers Falcon 9’s payload to the
                desired orbit. For maximum reliability, the second stage has redundant igniter systems.</p>
            <button class="btn btn-secondary">LEARN MORE</button>
        </div>
        <div class="block capacity">
            <div>
                <h4 class="with-underline">ENGINE</h4>
                <h6>9</h6>
            </div>
            <div>
                <h4 class="with-underline">BURNTIME</h4>
                <h6>162 <small>SEC</small></h6>
            </div>
        </div>
        <div class="block capacity single">
            <div>
                <h4 class="with-underline">Thrust At Sea Level</h4>
                <h6>7,607kN1</h6>
            </div>
        </div>
        <div class="block engines">
            <img src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/engines.png?alt=media&token=f99151ff-1668-465d-ad9d-259c8ff1bbb7"
                 alt="">
        </div>
        <div class="block marine">
            <h2>NINE MARLINE ENGINES</h2>
            <p>With its nine first-stage Merlin engines clustered together, Falcon 9 can sustain up to two engine
                shutdowns during flight and still successfully complete its mission. Falcon 9 is the only launch
                vehicle in its class with this key reliability feature.</p>
        </div>
    </div>
</section>


<footer>
    <div class="container">
        <div class="copyright">
            <div>
                <a href="#"><img class="footer-logo"
                                 src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/logo.png?alt=media&token=52035215-f78b-46fd-b8ce-8e6ae93c01b6"
                                 alt=""></a>
            </div>
            <span>&copy; 2050 Rish Design</span>
        </div>
        <div>
            <h1>About us</h1>
            <ul>
                <li><a href="#">WHO WE ARE</a></li>
                <li><a href="#">CONTACT US</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">MISSIONS</a></li>
                <li><a href="#">OTHER COMPANIES</a></li>
            </ul>
        </div>
        <div>
            <h1>Company</h1>
            <ul>
                <li><a href="https://www.spacex.com/careers/">CAREERS</a></li>
                <li><a href="#">LEGAL</a></li>
                <li><a href="https://www.spacex.com/media/privacy_policy_spacex.pdf">POLICY</a></li>
                <li><a href="#">PRESS</a></li>
                <li><a href="#">BLOG</a></li>
            </ul>
        </div>
        <div class="socials">
            <div class="footer-socials">
                <h1>Socials</h1>
                <a href="https://www.facebook.com/spacextechnologies"><i class="fab fa-facebook-f"></i></a>
                <a href="https://www.tumblr.com/search/spaceX"><i class="fab fa-tumblr"></i></a>
                <a href="https://www.instagram.com/spacex/"><i class="fab fa-instagram"></i></a>
                <a href="https://www.youtube.com/@SpaceX"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
</footer>


<script>
    (function () {
        let socials = document.querySelectorAll('.social div')

        socials.forEach(function (social, index) {
            social.style.animation = `moveIn .6s cubic-bezier(.51,.92,.24,1.15) forwards ${index/7 + 0.2}s`
        })

        let rocketPieces = document.querySelectorAll('.rocket-body span')

        let rocket = document.querySelector('.rocket')

        let triggerStart = window.innerHeight / 5;

        let rocketOffsetTop = rocket.offsetTop;

        let thirdOffsetTop = rocketPieces[2].offsetTop;

        document.addEventListener('scroll', (e) => {
            if (window.scrollY > (rocketOffsetTop - triggerStart)) {
                rocketPieces[0].classList.add('active');
                rocketPieces[1].classList.add('active');
            } else {
                rocketPieces[0].classList.remove('active');
                rocketPieces[1].classList.remove('active');
            }

            if (window.scrollY > (thirdOffsetTop - triggerStart)) {
                rocketPieces[2].classList.add('active');
            } else {
                rocketPieces[2].classList.remove('active');
            }
        })


    }())
</script>
</body>
</html>
