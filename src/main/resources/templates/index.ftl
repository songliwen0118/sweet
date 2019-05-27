<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="images/login_index.ico"/>
    <link type="text/css" rel="styleSheet" href="css/login.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hi,你好呀</title>
</head>

<body>
<div id="bg">
    <!-- 提示框 -->
    <div id="hint">
        <p>登录失败</p>
    </div>
    <div id="login_wrap">
        <!-- 登录注册切换动画 -->
        <div id="login">
            <div id="status">
                <i style="top: 0">Log</i>
                <i style="top: 35px">Sign</i>
                <i style="right: 5px">in</i>
            </div>
            <span>
                    <form action="post">
                        <p class="form"><input type="text" id="user" placeholder="username" autocomplete="off"></p>
                        <p class="form"><input type="password" id="pwd" placeholder="password"></p>
                        <p class="form confirm"><input type="password" id="confirm-passwd"
                                                       placeholder="confirm password"></p>
                        <input type="button" value="Log in" class="btn" onclick="login()" style="margin-right: 20px;"
                               id="login_enter">
                        <input type="button" value="Sign in" class="btn" onclick='signin()' id="btn">
                    </form>
                    <a href="/blog">No Secret Landing？</a>
                </span>
        </div>
        <!-- 图片绘制框 -->
        <div id="login_img">
            <span class="circle">
                    <span></span>
                    <span></span>
                </span>
            <span class="star">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </span>
            <span class="fly_star">
                    <span></span>
                    <span></span>
                </span>
            <p id="title">Liwen</p>
        </div>
    </div>
</div>
</body>

<script>
    var onoff = true;
    var confirm = document.getElementsByClassName("confirm")[0];
    var user = document.getElementById("user");
    var pwd = document.getElementById("pwd");
    var con_pass = document.getElementById("confirm-passwd");

    //自动居中title
    var name_c = document.getElementById("title");
    var name = name_c.innerHTML.split("");
    name_c.innerHTML = "";
    for (i = 0; i < name.length; i++)
        if (name[i] != ",")
            name_c.innerHTML += "<i>" + name[i] + "</i>";

    function hint() {
        let hit = document.getElementById("hint");
        hit.style.display = "block";
        setTimeout(function () {
            hit.style.opacity = 1
        }, 0);
        setTimeout(function () {
            hit.style.opacity = 0
        }, 2000);
        setTimeout(function () {
            hit.style.display = "none"
        }, 3000);
    }

    //回调函数
    /*function submit(callback) {
        //if (passwd.value == con_pass.value) {
        let request = new XMLHttpRequest()
        let url = ""
        request.open("post", url, true)
        let data = new FormData()
        data.append("username", user.value)
        data.append("password", pwd.value)
        request.onreadystatechange = function () {
            if (this.readyState == 4) {
                callback.call(this, this.response)
                //console.log(this.responseText)
            }
        }
        request.send(data)
    }*/

    document.onkeydown = function (e) {
        if (e.keyCode === 13) {
            document.getElementById("login_enter").onclick();
        }
    };

    function login() {
        if (onoff) {
            if (user.value !== "" && pwd.value !== "") {
                let url = "/api/login";
                let data = new FormData();
                let request = new XMLHttpRequest();
                request.open("post", url, true);
                data.append("username", user.value);
                data.append("password", pwd.value);
                request.onreadystatechange = function () {
                    if (this.readyState === 4) {
                        if (this.responseText === "登陆失败") {
                            hint()
                        } else {
                            window.location.href = this.responseText;
                        }
                    }
                };
                request.send(data)
            }
        } else {
            let status = document.getElementById("status").getElementsByTagName("i");
            confirm.style.height = 0;
            status[0].style.top = 0;
            status[1].style.top = 35 + "px";
            onoff = !onoff
        }
    }

    function signin() {
        let status = document.getElementById("status").getElementsByTagName("i");
        let hit = document.getElementById("hint").getElementsByTagName("p")[0];
        if (onoff) {
            confirm.style.height = 51 + "px";
            status[0].style.top = 35 + "px";
            status[1].style.top = 0;
            onoff = !onoff
        } else {
            if (!/^[A-Za-z0-9]+$/.test(user.value)) {
                hit.innerHTML = "账号只能为英文和数字";
            } else if (user.value.length < 6) {
                hit.innerHTML = "账号长度必须大于6位";
            } else if (pwd.value.length < 6) {
                hit.innerHTML = "密码长度必须大于6位";
            } else if (pwd.value !== con_pass.value) {
                hit.innerHTML = "两次密码不相等";
            } else if (pwd.value === con_pass.value) {
                let url = "/api/register";
                let data = new FormData();
                let request = new XMLHttpRequest();
                request.open("post", url, true);
                data.append("username", user.value);
                data.append("password", pwd.value);
                data.append("conPassword", con_pass.value);
                request.onreadystatechange = function () {
                    if (this.readyState === 4) {
                        if (this.responseText === "该账号已存在") {
                            hit.innerHTML = this.responseText;
                        } else if (this.responseText === "账号注册成功") {
                            hit.innerHTML = this.responseText + "，两秒后自动刷新页面";
                            // language=JavaScript
                            setTimeout("window.location.reload()", 2000)
                        } else {
                            hit.innerHTML = this.responseText;
                        }
                    }
                };
                request.send(data)
            }
            hint()
        }
    }

</script>
</html>