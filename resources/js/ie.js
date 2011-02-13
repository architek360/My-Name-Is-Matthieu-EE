// the only difference here from the previous declared jumps are the positioning after top
// scrollTop: $(target).offset().top - 220, they seem to differ a little on ie7

var jump=function(e)
{
       //prevent the "normal" behaviour which would be a "hard" jump
       e.preventDefault();
       //Get the target
       var target = $(this).attr("href");
       //perform animated scrolling
       $('html,body').animate(
       {
               //get top-position of target-element and set it as scroll target
               scrollTop: $(target).offset().top - 220
       //scrolldelay: 2 seconds
       },700);
}

var jump2=function(e)
{
       //prevent the "normal" behaviour which would be a "hard" jump
       e.preventDefault();
       //Get the target
       var target2 = $(this).attr("href");
       //perform animated scrolling
       $('html,body').animate(
       {
               //get top-position of target-element and set it as scroll target
               scrollTop: $(target2).offset().top - 310
       //scrolldelay: 2 seconds
       },700);
}
