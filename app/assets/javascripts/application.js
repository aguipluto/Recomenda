// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

/*

PRUEBAS PARA QUE LA BÚSQUEDA FUNCIONE AL IR TECLEANDO PERO SIN SOBRECARGAR LA API DE GOOGLE PLACES

function debounce(func, wait, immediate) {
    var timeout;
    return function () {
        var context = this, args = arguments;
        clearTimeout(timeout);
        timeout = setTimeout(function () {
            timeout = null;
            if (!immediate) func.apply(context, args);
        }, wait);
        if (immediate && !timeout) func.apply(context, args);
    };
};

window.onload = function () {

    var el = document.getElementById('inputSearchGoogle');

    el.addEventListener("keyup", myEfficientFn, false);

    window.addEventListener('resize', myEfficientFn);
}

var myEfficientFn = debounce(function () {
    $.get($("#inputSearchGoogle").attr("action"),
        {search: $("#inputSearchGoogle").val()}, null, "script");
}, 1000);*/