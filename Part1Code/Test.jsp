<!DOCTYPE html>
<html>
<body>

<h1>My First JavaScript</h1>
<p>Here, a JavaScript changes the value of the src (source) attribute of an image.</p>
<p id="state"></p>
<script>
function light(sw) {
  var pic;
  if (sw == 0) {
    pic = "pic_bulboff.gif"
    document.getElementById("state").innerHTML = 1;
  } else {
    pic = "pic_bulbon.gif"
    document.getElementById("state").innerHTML = 2;
  }
  document.getElementById('myImage').src = pic;
}
</script>

<img id="myImage" src="pic_bulboff.gif" width="100" height="180">

<p>
<button type="button" onclick="light(1)">Light On</button>
<button type="button" onclick="light(0)">Light Off</button>
</p>

</body>
</html>

