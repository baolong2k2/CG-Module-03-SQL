
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Multiverse Interface</title>
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- MDB -->
    <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
    ></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            /*overflow: hidden;*/
        }
        .background-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .background-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            animation: moveBackground 30s linear infinite;
        }


        .welcome-container {
            text-align: center;
            padding: 50px 0;
            /*background-color: rgba(0, 0, 0, 0.7);*/
            color: #fff;
        }

        .welcome-heading {
            font-size: 40px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            /*text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);*/
        }

        .container1 {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .multiverse-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .multiverse-list li {
            padding: 10px;
            border-bottom: 1px solid #eee;
            transition: background-color 0.3s ease;
        }

        .multiverse-list li:last-child {
            border-bottom: none;
        }

        .multiverse-list li a {
            color: #333;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .multiverse-list li:hover {
            background-color: #f9f9f9;
        }

        .multiverse-list li:hover a {
            color: #555;
        }

        .come-back-button {
            text-align: center;
            margin-top: 20px;
        }

        .come-back-button button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #2a5298;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .come-back-button button:hover {
            background-color: #1e3c72;
        }

        .thanos-glove {
            position: absolute;
            bottom: 20px;
            right: 20px;
            width: 80px;
            height: 100px;
            cursor: pointer;
            animation: shakeGlove 0.5s linear infinite;
        }

        .thanos-glove img {
            width: 100%;
            height: 100%;
        }

        @keyframes shakeGlove {
            0% {
                transform: rotate(-5deg);
            }
            50% {
                transform: rotate(5deg);
            }
            100% {
                transform: rotate(-5deg);
            }
        }
    </style>
</head>
<body>
<div class="background-container">
    <img src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/glowing-spaceship-orbits-sphere-deep-space-generated-by-ai.jpg?alt=media&token=85137bca-fc87-499c-9c32-c7f063c7aaa9" alt="Background Image">
</div>
<div class="welcome-container">
    <h1 class="welcome-heading">Welcome to the Multiverse</h1>
</div>
<%--<div class="container">--%>
<%--    <ul class="multiverse-list">--%>
<%--        <li><a href="#">Multiverse 1</a></li>--%>
<%--    </ul>--%>
<%--    <div class="come-back-button">--%>
<%--        <button onclick="goBack()">Come Back</button>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="container">
    <main class="d-inline-flex">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:if test="${requestScope['multiverse'] != null}">
                <c:forEach items="${requestScope['multiverse']}" var="multiverse">
                    <form action="/show" method="get">
                        <div class="col">
                            <div class="card h-100">
                                <div class="bg-image hover-zoom ripple" data-mdb-ripple-color="light">
                                    <img src="${multiverse.img}" class="img-fluid card-img-top" alt="Skyscrapers">
                                    <input type="hidden" name="id" value="${multiverse.getId()}">
                                    <button>
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                    </button>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><c:out value="${multiverse.getName()}"/></h5>
                                    <p class="card-text">
                                        <c:out value="${multiverse.detail}"/>
                                    </p>
                                    <button class="btn btn-primary">
                                        Discover more</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:forEach>
            </c:if>
        </div>
    </main>
</div>
<div class="thanos-glove" onclick="disappearPage()">
    <img src="https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/thanos_idle.png?alt=media&token=b477f5e4-5b2b-40ac-8bea-00ee8a4f2594" alt="Thanos Glove">
</div>

<script>
    function goBack() {
        window.history.back();
    }

    function disappearPage() {
        document.body.style.display = 'none';
    }
</script>

</body>
</html>



