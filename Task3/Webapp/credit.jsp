<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <% if(session.getAttribute("name")==null) { response.sendRedirect("login.jsp"); } %>
    <!doctype html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Belief_Bank/Credit</title>
      <link rel="icon" href="./img/icon.png">
      <script src="https://cdn.tailwindcss.com"></script>
      <script src="https://unpkg.com/@material-tailwind/html@latest/scripts/collapse.js"></script>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.0/flowbite.min.css" rel="stylesheet" />
      <link rel="stylesheet"
        href="https://demos.creative-tim.com/notus-js/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css">
      <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
      <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    </head>

    <body>
      <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>

      <nav class="bg-gray-900 fixed w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600">
        <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
          <a href="profile.jsp" class="flex items-center">
            <img src="./img/icon.png" class="h-10 mr-3 rounded-xl" alt="Belief_Bank">
            <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Belief_Bank</span>
          </a>
          <div class="flex md:order-2">
            <button type="button"
              class="text-white bg-blue-700 hover:bg-blue-800 mx-2 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center mr-3 md:mr-0 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
              <a href="logout">Logout</a>
            </button>
          </div>
        </div>
      </nav>
      <div class="mt-16"></div>
      <div class="my-auto"></div>
      <div class="container mx-auto my-5 p-5">
        <div class="md:flex no-wrap md:-mx-2 ">
          <div class="w-full md:w-3/12 md:mx-2">
            <div class="bg-white p-3 border-t-4 border-indigo-500">
              <div class="image overflow-hidden">
                <img class="h-auto w-full mx-auto" src="./img/user.png" alt="">
              </div>
              <h3 class="text-gray-900 font-bold text-md leading-8 my-1">
                <%=session.getAttribute("name")%>
              </h3>
              <h3 class="text-gray-600 font-lg text-semibold leading-6">Account Holder</h3>
              <ul
                class="bg-gray-100 text-gray-600 hover:text-gray-700 hover:shadow py-2 px-3 mt-3 divide-y rounded shadow-sm">
                <li class="flex items-center py-3">
                  <span>Status</span>
                  <span class="ml-auto"><span class="bg-indigo-500 py-1 px-2 rounded text-white text-sm">
                      <%=session.getAttribute("status")%>
                    </span></span>
                </li>
                <li class="flex items-center py-3">
                  <span>Account Type</span>
                  <span class="ml-auto">
                    <%=session.getAttribute("acctype")%>
                  </span>
                </li>
              </ul>
            </div>
          </div>

          <!-- credit -->
          <div class="flex-auto px-4 lg:px-10 py-10 pt-0 bg-gray-200">
            <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
            
             <%if(request.getAttribute("status")=="success") {%>
                                    <div
                                    class="mb-3 inline-flex w-full items-center rounded-lg bg-green-400 px-6 py-5 text-base text-success-700"
                                    role="alert">
                                    <span class="mr-2">
                                      <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="currentColor"
                                        class="h-5 w-5">
                                        <path
                                          fill-rule="evenodd"
                                          d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12zm13.36-1.814a.75.75 0 10-1.22-.872l-3.236 4.53L9.53 12.22a.75.75 0 00-1.06 1.06l2.25 2.25a.75.75 0 001.14-.094l3.75-5.25z"
                                          clip-rule="evenodd" />
                                      </svg>
                                    </span>
                                    Congrats - Amount Credited !
                                  </div>
                                        <%} %>
                                    <%if(request.getAttribute("status")=="failed") {%>
                                        <div
                                          class="mb-3 inline-flex w-full items-center rounded-lg bg-red-400 px-6 py-5 text-base text-danger-700"
                                          role="alert">
                                          <span class="mr-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5">
                                              <path fill-rule="evenodd"
                                                d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm-1.72 6.97a.75.75 0 10-1.06 1.06L10.94 12l-1.72 1.72a.75.75 0 101.06 1.06L12 13.06l1.72 1.72a.75.75 0 101.06-1.06L13.06 12l1.72-1.72a.75.75 0 10-1.06-1.06L12 10.94l-1.72-1.72z"
                                                clip-rule="evenodd" />
                                            </svg>
                                          </span>
                                          Something went wrong Try Again!
                                        </div>
                                        <%} %>
            
              <form class="space-y-6" name="frm" method="POST" action="credit">
                <div>
                  <h2 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">
                    Credit Amount to Account</h2>
                  <label for="camount" class="block text-sm font-medium leading-6 text-gray-900">Enter
                    Amount to Credit</label>
                  <div class="mt-2">
                    <input id="camount" name="camount" type="number" required minlength="1" maxlength="5"
                      class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                  </div>
                </div>

                <div>
                  <label for="password" class="block text-sm font-medium leading-6 text-gray-900">Enter
                    Password</label>
                  <div class="mt-2">
                    <input id="upassword" name="upassword" type="password" required minlength="5" maxlength="20"
                      class="block w-full rounded-xl border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                  </div>
                </div>

                <div>
                  <button type="submit" value="submit"
                    class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">credit</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        </div>
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
          <a href="profile.jsp">profile</a>
        </button>

        <div class="mt-10">
          <footer class="bg-gray-900 lg:grid lg:grid-cols-5">
            <div class="relative block h-32 lg:col-span-2 lg:h-full">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29818.202613522637!2d77.71295336443286!3d20.90123981581916!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bd6bb2b898fe3d1%3A0xf953b51392c19e74!2sSai%20Nagar%2C%20Amravati%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1691571594546!5m2!1sen!2sin"
                class="absolute inset-0 h-full w-full object-cover" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>

            <div class="px-4 bg-gray-900 py-16 sm:px-6 lg:col-span-3 lg:px-8">
              <div class="grid grid-cols-1 gap-8 sm:grid-cols-2">
                <div>
                  <p>
                    <span class="text-xs uppercase tracking-wide text-white">
                      Call us
                    </span>

                    <a href="tel:9789879283" class="block text-xl font-medium text-white hover:opacity-75 sm:text-3xl">
                     1234567890
                    </a>
                    <a href="mailto:chandanw03@gmail.com"
                      class="block text-xl font-medium text-white hover:opacity-75 sm:text-3xl">
                      Chandanw03@gmail.com
                    </a>
                  </p>

                  <ul class="mt-8 space-y-1 text-sm text-white">
                    <li>Monday to Friday: 8am - 10pm</li>
                    <li>Weekend: 10am - 3pm</li>
                  </ul>

                  <ul class="mt-8 flex gap-6">
                    <li>
                      <a href="https://twitter.com/iChandanW03?t=k5jwjAxmjU51jb1eZRCcog&s=09" rel="noreferrer"
                        target="_blank" class="text-white transition hover:opacity-75 ">
                        <span class="sr-only">Twitter</span>

                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                          <path
                            d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" />
                        </svg>
                      </a>
                    </li>

                    <li>
                      <a href="https://github.com/Chandan2024" rel="noreferrer" target="_blank"
                        class="text-white transition hover:opacity-75 ">
                        <span class="sr-only">GitHub</span>

                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                          <path fill-rule="evenodd"
                            d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                            clip-rule="evenodd" />
                        </svg>
                      </a>
                    </li>
                  </ul>
                </div>

                <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                  <div>
                    <p class="font-medium text-white">Services</p>

                    <ul class="mt-6 space-y-4 text-sm">
                      <li>
                        <p class="text-white transition hover:opacity-75 ">
                          Java
                        </p>
                      </li>

                      <li>
                        <p class="text-white transition hover:opacity-75 ">
                          HTML 5
                        </p>
                      </li>

                      <li>
                        <p class="text-white transition hover:opacity-75">
                          TailWind CSS
                        </p>
                      </li>

                      <li>
                        <p class="text-white transition hover:opacity-75">
                          Jdbc
                        </p>
                      </li>

                      <li>
                        <p class="text-white transition hover:opacity-75">
                          Git & Github
                        </p>
                      </li>
                    </ul>
                  </div>

                  <div>
                    <p class="font-medium text-white">Projects</p>

                    <ul class="mt-6 space-y-4 text-sm">
                      <li>
                        <a href="https://fit-bit-health.netlify.app" class="text-white transition hover:opacity-75">
                          Fit-Bit
                        </a>
                      </li>

                      <li>
                        <a href="https://d-coder-chandan.netlify.app" class="text-white transition hover:opacity-75">
                          PortFolio 1
                        </a>
                      </li>

                      <li>
                        <a href="https://d-coder-chandan-old.netlify.app"
                          class="text-white transition hover:opacity-75">
                          PortFolio 2
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>

              <div class="mt-12 border-t border-gray-100 pt-12 dark:border-gray-800">
                <div class="sm:flex sm:items-center sm:justify-between">
                  <ul class="flex flex-wrap gap-4 text-xs">
                    <li>
                      <a href="#" class="text-gray-500 transition hover:opacity-75 dark:text-gray-400">
                        Terms & Conditions
                      </a>
                    </li>

                    <li>
                      <a href="#" class="text-gray-500 transition hover:opacity-75 dark:text-gray-400">
                        Privacy Policy
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </footer>
          <footer class="bg-gray-900 text-center lg:text-left">
            <div class="p-4 text-center text-white">
              &copy; 2023 Copyright:
              <a class="text-white" href="https://d-coder-chandan.netlify.app">Chandan Werulkar. All rights
                reserved.</a>
            </div>
          </footer>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>


        <script>
          import {
            Collapse,
            initTE,
          } from "tw-elements";

          initTE({ Collapse });
        </script>
    </body>

    </html>