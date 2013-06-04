function recordClick( sellerID, categoryID, clickType, origin, src )
{
	if (origin == undefined) origin = 'DR';
    var requester;
    var i_cookies;

    i_cookies = navigator.cookieEnabled;

        try
        {
         requester = new XMLHttpRequest();
        }
        catch (error)
        {
         try
         {
           requester = new ActiveXObject("Microsoft.XMLHTTP");
         }
         catch (error)
         {
           return false;
         }
        }
        requester.open( "GET", "/v2/directory/recordClick.jsp?sell=" + sellerID + "&cat=" + categoryID + "&type=" + clickType + "&origin=" + origin + "&src=" + src );
        requester.send( null );
}