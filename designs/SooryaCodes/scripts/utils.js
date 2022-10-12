const toolTipOptions = {
  content: "Copied!",
  animation: "scale",
  arrow: false,
  placement: "top",

  theme: "custom",
  trigger: "click",
};

const RGBToHSL = (r, g, b) => {
  (r /= 255), (g /= 255), (b /= 255);

  var max = Math.max(r, g, b),
    min = Math.min(r, g, b);
  var h,
    s,
    l = (max + min) / 2;

  if (max == min) {
    h = s = 0; // achromatic
  } else {
    var d = max - min;
    s = l > 0.5 ? d / (2 - max - min) : d / (max + min);

    switch (max) {
      case r:
        h = (g - b) / d + (g < b ? 6 : 0);
        break;
      case g:
        h = (b - r) / d + 2;
        break;
      case b:
        h = (r - g) / d + 4;
        break;
    }

    h /= 6;
  }
  return `hsl(${(h * 360).toString().split(".")[0]}, ${
    (s * 100).toString().split(".")[0]
  }%, ${(l * 100).toString().split(".")[0]}%)`;
};

const copyColor = (text) => {
  navigator.clipboard
    .writeText(text)
    .then(() => {})
    .catch((err) => {
      alert(err);
    });
};