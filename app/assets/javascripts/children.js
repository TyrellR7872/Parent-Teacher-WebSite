"use strict";

var children = (function() {
    // make any additional "private" function or variables here
    var increaseBtnOnclick = function(arg){
          var data= arg.detail[0]
          console.log(data)
          jQuery("#htop").text(data["increase"])
          jQuery("#htop").text(data["decrease"])
          // document.getElementById("htop").value = Number(document.getElementById("htop").value)+ 1;
      }
      // var decreaseBtnOnclick = function(){
      //     document.getElementById("htop").value = Number(document.getElementById("htop").value) - 1;
      // }

    };

    return {
        init: function() {
            //
            // do any initialization for javascript here
            //
            $("a[data-remote]").bind("ajax:success", increaseBtnOnclick);
            // $("a[data-remote]").bind("ajax:success", decreaseBtnOnclick);

        },
    };

})();
$(children.init);
