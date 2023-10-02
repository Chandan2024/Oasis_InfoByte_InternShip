<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!doctype html>
  <html>

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Belief_Bank/Login</title>
    <link rel="icon" href="./img/icon.png">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/@material-tailwind/html@latest/scripts/collapse.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.0/flowbite.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://demos.creative-tim.com/notus-js/assets/styles/tailwind.css">
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <link rel="stylesheet"
      href="https://demos.creative-tim.com/notus-js/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
   </head>

  <body>
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>

    <section class="flex flex-col md:flex-row h-screen items-center">

      <div class="bg-indigo-600 hidden lg:block w-full md:w-1/2 xl:w-2/3 h-screen">
        <img src="https://source.unsplash.com/random/?password,login,lock" alt="" class="w-full h-full object-cover">
      </div>

      <div class="w-full md:max-w-md lg:max-w-full md:mx-auto md:mx-0 md:w-1/2 xl:w-1/3 h-screen px-6 lg:px-16 xl:px-12
          flex items-center justify-center">

        <div class="w-full h-100">

          <%if(request.getAttribute("status")=="failed") {%>
            <div
              class="mb-3 inline-flex w-full items-center rounded-lg bg-red-200 px-6 py-5 text-base text-danger-700"
              role="alert">
              <span class="mr-2">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5">
                  <path fill-rule="evenodd"
                    d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm-1.72 6.97a.75.75 0 10-1.06 1.06L10.94 12l-1.72 1.72a.75.75 0 101.06 1.06L12 13.06l1.72 1.72a.75.75 0 101.06-1.06L13.06 12l1.72-1.72a.75.75 0 10-1.06-1.06L12 10.94l-1.72-1.72z"
                    clip-rule="evenodd" />
                </svg>
              </span>
              Wrong Credentials - Try Again!
            </div>
            <%} %>
              <h1 class="text-xl md:text-2xl font-bold leading-tight mt-12 fas">Log in to your account &#xf502;</h1>

              <form class="mt-6" name="frm" method="POST" action="login">
                <div>
                  <label class="block text-gray-700 ">Email Address</label>
                  <input type="email" name="uemail" id="uemail" placeholder="Enter Email Address"
                    class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-blue-500 focus:bg-white focus:outline-none"
                    autofocus autocomplete required>
                </div>

                <div class="mt-4">
                  <label class="block text-gray-700 fas">Password &#xf084;</label>
                  <input type="password" name="upassword" id="upassword" placeholder="Enter Password" minlength="6"
                    class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-blue-500
                  focus:bg-white focus:outline-none" required>
                </div>

                <div class="text-right mt-2">
                  <a href="forgot.jsp" class="text-blue-500 hover:text-blue-700 font-semibold"><i class='fas'>&#xf583;</i> Forgot Password?</a>
                </div>

                <button type="submit" class="w-full block bg-indigo-500 hover:bg-indigo-400 focus:bg-indigo-400 text-white font-semibold rounded-lg
                px-4 py-3 mt-6">Log In</button>
              </form>

              <hr class="my-6 border-gray-300 w-full">

              <p class="mt-8">Need an account? <a href="register.jsp"
                  class="text-blue-500 hover:text-blue-700 font-semibold">Create an
                  account</a></p>
              <p class="mt-8"><a href="adminlogin.jsp" class="text-blue-500 hover:text-blue-700 font-semibold">Admin
                  Login</a></p>

        </div>
      </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>

  </body>

  </html>