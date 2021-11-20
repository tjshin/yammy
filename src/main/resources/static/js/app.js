var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    $("#send").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#msg").html("");
    $("#enter").html("====================챗봇과 연결되었습니다.=====================");
}

function connect() {
    var socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/public', function (message) {
            showReceMessage(message.body); 
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendMessage() {
    let message = $("#msg").val()
    showSendMessage(message);

    stompClient.send("/app/sendMessage", {}, JSON.stringify(message));
}

function showReceMessage(message) {
    $("#chat-container").append("&nbsp;&nbsp;Yammy⚾<br/><div class='chat-box'><div class='chat' id='receMessage'>" + message + "</div></div><br/><br/>");
}

function showSendMessage(message) {
    $("#chat-container").append("<div class='chat-box'><div class='chat' id='sendMessage'>" + message + "</div></div><br/><br/>");
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendMessage(); });
});

