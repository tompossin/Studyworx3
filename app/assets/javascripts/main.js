/**
 * @author Tom Possin
 */

$(window).load(function(){
  $('#alert').fadeOut(5000);
  $('#notice').fadeOut(5000);
});

	function ShowHide(divId)
	{
		if(document.getElementById(divId).style.display == 'none')
			{
			document.getElementById(divId).style.display='block';
			}
		else
			{
			document.getElementById(divId).style.display = 'none';
			}
	}
	
	function OpenFullProfile(user_id)
  {
    window.open("/profiles/"+user_id+"/edit","_self")
  }
	