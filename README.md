<!DOCTYPE html>
<html lang="en"><head>
<script src="Test de hipótesis_files/libs/clipboard/clipboard.min.js"></script>
<script src="Test de hipótesis_files/libs/quarto-html/tabby.min.js"></script>
<script src="Test de hipótesis_files/libs/quarto-html/popper.min.js"></script>
<script src="Test de hipótesis_files/libs/quarto-html/tippy.umd.min.js"></script>
<link href="Test de hipótesis_files/libs/quarto-html/tippy.css" rel="stylesheet">
<link href="Test de hipótesis_files/libs/quarto-html/quarto-html.min.css" rel="stylesheet" data-mode="light">
<link href="Test de hipótesis_files/libs/quarto-html/quarto-syntax-highlighting.css" rel="stylesheet" id="quarto-text-highlighting-styles"><meta charset="utf-8">
  <meta name="generator" content="quarto-1.2.475">

  <meta name="author" content="José RTM, MSc">
  <title>Test de hipótesis</title>
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">
  <link rel="stylesheet" href="Test de hipótesis_files/libs/revealjs/dist/reset.css">
  <link rel="stylesheet" href="Test de hipótesis_files/libs/revealjs/dist/reveal.css">
  <style>
    code{white-space: pre-wrap;}
    span.smallcaps{font-variant: small-caps;}
    div.columns{display: flex; gap: min(4vw, 1.5em);}
    div.column{flex: auto; overflow-x: auto;}
    div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
    ul.task-list{list-style: none;}
    ul.task-list li input[type="checkbox"] {
      width: 0.8em;
      margin: 0 0.8em 0.2em -1.6em;
      vertical-align: middle;
    }
    pre > code.sourceCode { white-space: pre; position: relative; }
    pre > code.sourceCode > span { display: inline-block; line-height: 1.25; }
    pre > code.sourceCode > span:empty { height: 1.2em; }
    .sourceCode { overflow: visible; }
    code.sourceCode > span { color: inherit; text-decoration: inherit; }
    div.sourceCode { margin: 1em 0; }
    pre.sourceCode { margin: 0; }
    @media screen {
    div.sourceCode { overflow: auto; }
    }
    @media print {
    pre > code.sourceCode { white-space: pre-wrap; }
    pre > code.sourceCode > span { text-indent: -5em; padding-left: 5em; }
    }
    pre.numberSource code
      { counter-reset: source-line 0; }
    pre.numberSource code > span
      { position: relative; left: -4em; counter-increment: source-line; }
    pre.numberSource code > span > a:first-child::before
      { content: counter(source-line);
        position: relative; left: -1em; text-align: right; vertical-align: baseline;
        border: none; display: inline-block;
        -webkit-touch-callout: none; -webkit-user-select: none;
        -khtml-user-select: none; -moz-user-select: none;
        -ms-user-select: none; user-select: none;
        padding: 0 4px; width: 4em;
        color: #aaaaaa;
      }
    pre.numberSource { margin-left: 3em; border-left: 1px solid #aaaaaa;  padding-left: 4px; }
    div.sourceCode
      { color: #003b4f; background-color: #f1f3f5; }
    @media screen {
    pre > code.sourceCode > span > a:first-child::before { text-decoration: underline; }
    }
    code span { color: #003b4f; } /* Normal */
    code span.al { color: #ad0000; } /* Alert */
    code span.an { color: #5e5e5e; } /* Annotation */
    code span.at { color: #657422; } /* Attribute */
    code span.bn { color: #ad0000; } /* BaseN */
    code span.bu { } /* BuiltIn */
    code span.cf { color: #003b4f; } /* ControlFlow */
    code span.ch { color: #20794d; } /* Char */
    code span.cn { color: #8f5902; } /* Constant */
    code span.co { color: #5e5e5e; } /* Comment */
    code span.cv { color: #5e5e5e; font-style: italic; } /* CommentVar */
    code span.do { color: #5e5e5e; font-style: italic; } /* Documentation */
    code span.dt { color: #ad0000; } /* DataType */
    code span.dv { color: #ad0000; } /* DecVal */
    code span.er { color: #ad0000; } /* Error */
    code span.ex { } /* Extension */
    code span.fl { color: #ad0000; } /* Float */
    code span.fu { color: #4758ab; } /* Function */
    code span.im { color: #00769e; } /* Import */
    code span.in { color: #5e5e5e; } /* Information */
    code span.kw { color: #003b4f; } /* Keyword */
    code span.op { color: #5e5e5e; } /* Operator */
    code span.ot { color: #003b4f; } /* Other */
    code span.pp { color: #ad0000; } /* Preprocessor */
    code span.sc { color: #5e5e5e; } /* SpecialChar */
    code span.ss { color: #20794d; } /* SpecialString */
    code span.st { color: #20794d; } /* String */
    code span.va { color: #111111; } /* Variable */
    code span.vs { color: #20794d; } /* VerbatimString */
    code span.wa { color: #5e5e5e; font-style: italic; } /* Warning */
  </style>
  <link rel="stylesheet" href="Test de hipótesis_files/libs/revealjs/dist/theme/quarto.css" id="theme">
  <link href="Test de hipótesis_files/libs/revealjs/plugin/quarto-line-highlight/line-highlight.css" rel="stylesheet">
  <link href="Test de hipótesis_files/libs/revealjs/plugin/reveal-menu/menu.css" rel="stylesheet">
  <link href="Test de hipótesis_files/libs/revealjs/plugin/reveal-menu/quarto-menu.css" rel="stylesheet">
  <link href="Test de hipótesis_files/libs/revealjs/plugin/quarto-support/footer.css" rel="stylesheet">
  <style type="text/css">

  .callout {
    margin-top: 1em;
    margin-bottom: 1em;  
    border-radius: .25rem;
  }

  .callout.callout-style-simple { 
    padding: 0em 0.5em;
    border-left: solid #acacac .3rem;
    border-right: solid 1px silver;
    border-top: solid 1px silver;
    border-bottom: solid 1px silver;
    display: flex;
  }

  .callout.callout-style-default {
    border-left: solid #acacac .3rem;
    border-right: solid 1px silver;
    border-top: solid 1px silver;
    border-bottom: solid 1px silver;
  }

  .callout .callout-body-container {
    flex-grow: 1;
  }

  .callout.callout-style-simple .callout-body {
    font-size: 1rem;
    font-weight: 400;
  }

  .callout.callout-style-default .callout-body {
    font-size: 0.9rem;
    font-weight: 400;
  }

  .callout.callout-captioned.callout-style-simple .callout-body {
    margin-top: 0.2em;
  }

  .callout:not(.callout-captioned) .callout-body {
      display: flex;
  }

  .callout:not(.no-icon).callout-captioned.callout-style-simple .callout-content {
    padding-left: 1.6em;
  }

  .callout.callout-captioned .callout-header {
    padding-top: 0.2em;
    margin-bottom: -0.2em;
  }

  .callout.callout-captioned .callout-caption  p {
    margin-top: 0.5em;
    margin-bottom: 0.5em;
  }
    
  .callout.callout-captioned.callout-style-simple .callout-content  p {
    margin-top: 0;
  }

  .callout.callout-captioned.callout-style-default .callout-content  p {
    margin-top: 0.7em;
  }

  .callout.callout-style-simple div.callout-caption {
    border-bottom: none;
    font-size: .9rem;
    font-weight: 600;
    opacity: 75%;
  }

  .callout.callout-style-default  div.callout-caption {
    border-bottom: none;
    font-weight: 600;
    opacity: 85%;
    font-size: 0.9rem;
    padding-left: 0.5em;
    padding-right: 0.5em;
  }

  .callout.callout-style-default div.callout-content {
    padding-left: 0.5em;
    padding-right: 0.5em;
  }

  .callout.callout-style-simple .callout-icon::before {
    height: 1rem;
    width: 1rem;
    display: inline-block;
    content: "";
    background-repeat: no-repeat;
    background-size: 1rem 1rem;
  }

  .callout.callout-style-default .callout-icon::before {
    height: 0.9rem;
    width: 0.9rem;
    display: inline-block;
    content: "";
    background-repeat: no-repeat;
    background-size: 0.9rem 0.9rem;
  }

  .callout-caption {
    display: flex
  }
    
  .callout-icon::before {
    margin-top: 1rem;
    padding-right: .5rem;
  }

  .callout.no-icon::before {
    display: none !important;
  }

  .callout.callout-captioned .callout-body > .callout-content > :last-child {
    margin-bottom: 0.5rem;
  }

  .callout.callout-captioned .callout-icon::before {
    margin-top: .5rem;
    padding-right: .5rem;
  }

  .callout:not(.callout-captioned) .callout-icon::before {
    margin-top: 1rem;
    padding-right: .5rem;
  }

  /* Callout Types */

  div.callout-note {
    border-left-color: #4582ec !important;
  }

  div.callout-note .callout-icon::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAIKADAAQAAAABAAAAIAAAAACshmLzAAAEU0lEQVRYCcVXTWhcVRQ+586kSUMMxkyaElstCto2SIhitS5Ek8xUKV2poatCcVHtUlFQk8mbaaziwpWgglJwVaquitBOfhQXFlqlzSJpFSpIYyXNjBNiTCck7x2/8/LeNDOZxDuEkgOXe++553zfefee+/OYLOXFk3+1LLrRdiO81yNqZ6K9cG0P3MeFaMIQjXssE8Z1JzLO9ls20MBZX7oG8w9GxB0goaPrW5aNMp1yOZIa7Wv6o2ykpLtmAPs/vrG14Z+6d4jpbSKuhdcSyq9wGMPXjonwmESXrriLzFGOdDBLB8Y6MNYBu0dRokSygMA/mrun8MGFN3behm6VVAwg4WR3i6FvYK1T7MHo9BK7ydH+1uurECoouk5MPRyVSBrBHMYwVobG2aOXM07sWrn5qgB60rc6mcwIDJtQrnrEr44kmy+UO9r0u9O5/YbkS9juQckLed3DyW2XV/qWBBB3ptvI8EUY3I9p/67OW+g967TNr3Sotn3IuVlfMLVnsBwH4fsnebJvyGm5GeIUA3jljERmrv49SizPYuq+z7c2H/jlGC+Ghhupn/hcapqmcudB9jwJ/3jvnvu6vu5lVzF1fXyZuZZ7U8nRmVzytvT+H3kilYvH09mLWrQdwFSsFEsxFVs5fK7A0g8gMZjbif4ACpKbjv7gNGaD8bUrlk8x+KRflttr22JEMRUbTUwwDQScyzPgedQHZT0xnx7ujw2jfVfExwYHwOsDTjLdJ2ebmeQIlJ7neo41s/DrsL3kl+W2lWvAga0tR3zueGr6GL78M3ifH0rGXrBC2aAR8uYcIA5gwV8zIE8onoh8u0Fca/ciF7j1uOzEnqcIm59sEXoGc0+z6+H45V1CvAvHcD7THztu669cnp+L0okAeIc6zjbM/24LgGM1gZk7jnRu1aQWoU9sfUOuhrmtaPIO3YY1KLLWZaEO5TKUbMY5zx8W9UJ6elpLwKXbsaZ4EFl7B4bMtDv0iRipKoDQT2sNQI9b1utXFdYisi+wzZ/ri/1m7QfDgEuvgUUEIJPq3DhX/5DWNqIXDOweC2wvIR90Oq3lDpdMIgD2r0dXvGdsEW5H6x6HLRJYU7C69VefO1x8Gde1ZFSJLfWS1jbCnhtOPxmpfv2LXOA2Xk2tvnwKKPFuZ/oRmwBwqRQDcKNeVQkYcOjtWVBuM/JuYw5b6isojIkYxyYAFn5K7ZBF10fea52y8QltAg6jnMqNHFBmGkQ1j+U43HMi2xMar1Nv0zGsf1s8nUsmUtPOOrbFIR8bHFDMB5zL13Gmr/kGlCkUzedTzzmzsaJXhYawnA3UmARpiYj5ooJZiUoxFRtK3X6pgNPv+IZVPcnwbOl6f+aBaO1CNvPW9n9LmCp01nuSaTRF2YxHqZ8DYQT6WsXT+RD6eUztwYLZ8rM+rcPxamv1VQzFUkzFXvkiVrySGQgJNvXHJAxiU3/NwiC03rSf05VBaPtu/Z7/B8Yn/w7eguloAAAAAElFTkSuQmCC');
  }

  div.callout-note.callout-style-default .callout-caption {
    background-color: #dae6fb
  }

  div.callout-important {
    border-left-color: #d9534f !important;
  }

  div.callout-important .callout-icon::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAIKADAAQAAAABAAAAIAAAAACshmLzAAAEKklEQVRYCcVXTWhcVRS+575MJym48A+hSRFr00ySRQhURRfd2HYjk2SSTokuBCkU2o0LoSKKraKIBTcuFCoidGFD08nkBzdREbpQ1EDNIv8qSGMFUboImMSZd4/f9zJv8ibJMC8xJQfO3HPPPef7zrvvvnvviIkpC9nsw0UttFunbUhpFzFtarSd6WJkStVMw5xyVqYTvkwfzuf/5FgtkVoB0729j1rjXwThS7Vio+Mo6DNnvLfahoZ+i/o32lULuJ3NNiz7q6+pyAUkJaFF6JwaM2lUJlV0MlnQn5aTRbEu0SEqHUa0A4AdiGuB1kFXRfVyg5d87+Dg4DL6m2TLAub60ilj7A1Ec4odSAc8X95sHh7+ZRPCFo6Fnp7HfU/fBng/hi10CjCnWnJjsxvDNxWw0NfV6Rv5GgP3I3jGWXumdTD/3cbEOP2ZbOZp69yniG3FQ9z1jD7bnBu9Fc2tKGC2q+uAJOQHBDRiZX1x36o7fWBs7J9ownbtO+n0/qWkvW7UPIfc37WgT6ZGR++EOJyeQDSb9UB+DZ1G6DdLDzyS+b/kBCYGsYgJbSQHuThGKRcw5xdeQf8YdNHsc6ePXrlSYMBuSIAFTGAtQo+VuALo4BX83N190NWZWbynBjhOHsmNfFWLeL6v+ynsA58zDvvAC8j5PkbOcXCMg2PZFk3q8MjI7WAG/Dp9AwP7jdGBOOQkAvlFUB+irtm16I1Zw9YBcpGTGXYmk3kQIC/Cds55l+iMI3jqhjAuaoe+am2Jw5GT3Nbz3CkE12NavmzN5+erJW7046n/CH1RO/RVa8lBLozXk9uqykkGAyRXLWlLv5jyp4RFsG5vGVzpDLnIjTWgnRy2Rr+tDKvRc7Y8AyZq10jj8DqXdnIRNtFZb+t/ZRtXcDiVnzpqx8mPcDWxgARUqx0W1QB9MeUZiNrV4qP+Ehc+BpNgATsTX8ozYKL2NtFYAHc84fG7ndxUPr+AR/iQSns7uSUufAymwDOb2+NjK27lEFocm/EE2WpyIy/Hi66MWuMKJn8RvxIcj87IM5Vh9663ziW36kR0HNenXuxmfaD8JC7tfKbrhFr7LiZCrMjrzTeGx+PmkosrkNzW94ObzwocJ7A1HokLolY+AvkTiD/q1H0cN48c5EL8Crkttsa/AXQVDmutfyku0E7jShx49XqV3MFK8IryDhYVbj7Sj2P2eBxwcXoe8T8idsKKPRcnZw1b+slFTubwUwhktrfnAt7J++jwQtLZcm3sr9LQrjRzz6cfMv9aLvgmnAGvpoaGLxM4mAEaLV7iAzQ3oU0IvD5x9ix3yF2RAAuYAOO2f7PEFWCXZ4C9Pb2UsgDeVnFSpbFK7/IWu7TPTvBqzbGdCHOJQSxiEjt6IyZmxQyEJHv6xyQsYk//moVFsN2zP6fRImjfq7/n/wFDguUQFNEwugAAAABJRU5ErkJggg==');
  }

  div.callout-important.callout-style-default .callout-caption {
    background-color: #f7dddc
  }

  div.callout-warning {
    border-left-color: #f0ad4e !important;
  }

  div.callout-warning .callout-icon::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAIKADAAQAAAABAAAAIAAAAACshmLzAAAETklEQVRYCeVWW2gcVRg+58yaTUnizqbipZeX4uWhBEniBaoUX1Ioze52t7sRq6APio9V9MEaoWlVsFasRq0gltaAPuxms8lu0gcviE/FFOstVbSIxgcv6SU7EZqmdc7v9+9mJtNks51NTUH84ed889/PP+cmxP+d5FIbMJmNbpREu4WUkiTtCicKny0l1pIKmBzovF2S+hIJHX8iEu3hZJ5lNZGqyRrGSIQpq15AzF28jgpeY6yk6GVdrfFqdrD6Iw+QlB8g0YS2g7dyQmXM/IDhBhT0UCiRf59lfqmmDvzRt6kByV/m4JjtzuaujMUM2c5Z2d6JdKrRb3K2q6mA+oYVz8JnDdKPmmNthzkAk/lN63sYPgevrguc72aZX/L9C6x09GYyxBgCX4NlvyGUHOKELlm5rXeR1kchuChJt4SSwyddZRXgvwMGvYo4QSlk3/zkHD8UHxwVJA6zjZZqP8v8kK8OWLnIZtLyCAJagYC4rTGW/9Pqj92N/c+LUaAj27movwbi19tk/whRCIE7Q9vyI6yvRpftAKVTdUjOW40X3h5OXsKCdmFcx0xlLJoSuQngnrJe7Kcjm4OMq9FlC7CMmScQANuNvjfP3PjGXDBaUQmbp296S5L4DrpbrHN1T87ZVEZVCzg1FF0Ft+dKrlLukI+/c9ENo+TvlTDbYFvuKPtQ9+l052rXrgKoWkDAFnvh0wTOmYn8R5f4k/jN/fZiCM1tQx9jQQ4ANhqG4hiL0qIFTGViG9DKB7GYzgubnpofgYRwO+DFjh0Zin2m4b/97EDkXkc+f6xYAPX0KK2I/7fUQuwzuwo/L3AkcjugPNixC8cHf0FyPjWlItmLxWw4Ou9YsQCr5fijMGoD/zpdRy95HRysyXA74MWOnscpO4j2y3HAVisw85hX5+AFBRSHt4ShfLFkIMXTqyKFc46xdzQM6XbAi702a7sy04J0+feReMFKp5q9esYLCqAZYw/k14E/xcLLsFElaornTuJB0svMuJINy8xkIYuL+xPAlWRceH6+HX7THJ0djLUom46zREu7tTkxwmf/FdOZ/sh6Q8qvEAiHpm4PJ4a/doJe0gH1t+aHRgCzOvBvJedEK5OFE5jpm4AGP2a8Dxe3gGJ/pAutug9Gp6he92CsSsWBaEcxGx0FHytmIpuqGkOpldqNYQK8cSoXvd+xLxXADw0kf6UkJNFtdo5MOgaLjiQOQHcn+A6h5NuL2s0qsC2LOM75PcF3yr5STuBSAcGG+meA14K/CI21HcS4LBT6tv0QAh8Dr5l93AhZzG5ZJ4VxAqdZUEl9z7WJ4aN+svMvwHHL21UKTd1mqvChH7/Za5xzXBBKrUcB0TQ+Ulgkfbi/H/YT5EptrGzsEK7tR1B7ln9BBwckYfMiuSqklSznIuoIIOM42MQO+QnduCoFCI0bpkzjCjddHPN/F+2Yu+sd9bKNpVwHhbS3LluK/0zgfwD0xYI5dXuzlQAAAABJRU5ErkJggg==');
  }

  div.callout-warning.callout-style-default .callout-caption {
    background-color: #fcefdc
  }

  div.callout-tip {
    border-left-color: #02b875 !important;
  }

  div.callout-tip .callout-icon::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAIKADAAQAAAABAAAAIAAAAACshmLzAAADr0lEQVRYCe1XTWgTQRj9ZjZV8a9SPIkKgj8I1bMHsUWrqYLVg4Ue6v9BwZOxSYsIerFao7UiUryIqJcqgtpimhbBXoSCVxUFe9CTiogUrUp2Pt+3aUI2u5vdNh4dmMzOzHvvezuz8xNFM0mjnbXaNu1MvFWRXkXEyE6aYOYJpdW4IXuA4r0fo8qqSMDBU0v1HJUgVieAXxzCsdE/YJTdFcVIZQNMyhruOMJKXYFoLfIfIvVIMWdsrd+Rpd86ZmyzzjJmLStqRn0v8lzkb4rVIXvnpScOJuAn2ACC65FkPzEdEy4TPWRLJ2h7z4cArXzzaOdKlbOvKKX25Wl00jSnrwVxAg3o4dRxhO13RBSdNvH0xSARv3adTXbBdTf64IWO2vH0LT+cv4GR1DJt+DUItaQogeBX/chhbTBxEiZ6gftlDNXTrvT7co4ub5A6gp9HIcHvzTa46OS5fBeP87Qm0fQkr4FsYgVQ7Qg+ZayaDg9jhg1GkWj8RG6lkeSacrrHgDaxdoBiZPg+NXV/KifMuB6//JmYH4CntVEHy/keA6x4h4CU5oFy8GzrBS18cLJMXcljAKB6INjWsRcuZBWVaS3GDrqB7rdapVIeA+isQ57Eev9eCqzqOa81CY05VLd6SamW2wA2H3SiTbnbSxmzfp7WtKZkqy4mdyAlGx7ennghYf8voqp9cLSgKdqNfa6RdRsAAkPwRuJZNbpByn+RrJi1RXTwdi8RQF6ymDwGMAtZ6TVE+4uoKh+MYkcLsT0Hk8eAienbiGdjJHZTpmNjlbFJNKDVAp2fJlYju6IreQxQ08UJDNYdoLSl6AadO+fFuCQqVMB1NJwPm69T04Wv5WhfcWyfXQB+wXRs1pt+nCknRa0LVzSA/2B+a9+zQJadb7IyyV24YAxKp2Jqs3emZTuNnKxsah+uabKbMk7CbTgJx/zIgQYErIeTKRQ9yD9wxVof5YolPHqaWo7TD6tJlh7jQnK5z2n3+fGdggIOx2kaa2YI9QWarc5Ce1ipNWMKeSG4DysFF52KBmTNMmn5HqCFkwy34rDg05gDwgH3bBi+sgFhN/e8QvRn8kbamCOhgrZ9GJhFDgfcMHzFb6BAtjKpFhzTjwv1KCVuxHvCbsSiEz4CANnj84cwHdFXAbAOJ4LTSAawGWFn5tDhLMYz6nWeU2wJfIhmIJBefcd/A5FWQWGgrWzyORZ3Q6HuV+Jf0Bj+BTX69fm1zWgK7By1YTXchFDORywnfQ7GpzOo6S+qECrsx2ifVQAAAABJRU5ErkJggg==');
  }

  div.callout-tip.callout-style-default .callout-caption {
    background-color: #ccf1e3
  }

  div.callout-caution {
    border-left-color: #fd7e14 !important;
  }

  div.callout-caution .callout-icon::before {
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAIKADAAQAAAABAAAAIAAAAACshmLzAAACV0lEQVRYCdVWzWoUQRCuqp2ICBLJXgITZL1EfQDBW/bkzUMUD7klD+ATSHBEfAIfQO+iXsWDxJsHL96EHAwhgzlkg8nBg25XWb0zIb0zs9muYYWkoKeru+vn664fBqElyZNuyh167NXJ8Ut8McjbmEraKHkd7uAnAFku+VWdb3reSmRV8PKSLfZ0Gjn3a6Xlcq9YGb6tADjn+lUfTXtVmaZ1KwBIvFI11rRXlWlatwIAAv2asaa9mlB9wwygiDX26qaw1yYPzFXg2N1GgG0FMF8Oj+VIx7E/03lHx8UhvYyNZLN7BwSPgekXXLribw7w5/c8EF+DBK5idvDVYtEEwMeYefjjLAdEyQ3M9nfOkgnPTEkYU+sxMq0BxNR6jExrAI31H1rzvLEfRIdgcv1XEdj6QTQAS2wtstEALLG1yEZ3QhH6oDX7ExBSFEkFINXH98NTrme5IOaaA7kIfiu2L8A3qhH9zRbukdCqdsA98TdElyeMe5BI8Rs2xHRIsoTSSVFfCFCWGPn9XHb4cdobRIWABNf0add9jakDjQJpJ1bTXOJXnnRXHRf+dNL1ZV1MBRCXhMbaHqGI1JkKIL7+i8uffuP6wVQAzO7+qVEbF6NbS0LJureYcWXUUhH66nLR5rYmva+2tjRFtojkM2aD76HEGAD3tPtKM309FJg5j/K682ywcWJ3PASCcycH/22u+Bh7Aa0ehM2Fu4z0SAE81HF9RkB21c5bEn4Dzw+/qNOyXr3DCTQDMBOdhi4nAgiFDGCinIa2owCEChUwD8qzd03PG+qdW/4fDzjUMcE1ZpIAAAAASUVORK5CYII=');
  }

  div.callout-caution.callout-style-default .callout-caption {
    background-color: #ffe5d0
  }

  </style>
  <style type="text/css">
    .reveal div.sourceCode {
      margin: 0;
      overflow: auto;
    }
    .reveal div.hanging-indent {
      margin-left: 1em;
      text-indent: -1em;
    }
    .reveal .slide:not(.center) {
      height: 100%;
    }
    .reveal .slide.scrollable {
      overflow-y: auto;
    }
    .reveal .footnotes {
      height: 100%;
      overflow-y: auto;
    }
    .reveal .slide .absolute {
      position: absolute;
      display: block;
    }
    .reveal .footnotes ol {
      counter-reset: ol;
      list-style-type: none; 
      margin-left: 0;
    }
    .reveal .footnotes ol li:before {
      counter-increment: ol;
      content: counter(ol) ". "; 
    }
    .reveal .footnotes ol li > p:first-child {
      display: inline-block;
    }
    .reveal .slide ul,
    .reveal .slide ol {
      margin-bottom: 0.5em;
    }
    .reveal .slide ul li,
    .reveal .slide ol li {
      margin-top: 0.4em;
      margin-bottom: 0.2em;
    }
    .reveal .slide ul[role="tablist"] li {
      margin-bottom: 0;
    }
    .reveal .slide ul li > *:first-child,
    .reveal .slide ol li > *:first-child {
      margin-block-start: 0;
    }
    .reveal .slide ul li > *:last-child,
    .reveal .slide ol li > *:last-child {
      margin-block-end: 0;
    }
    .reveal .slide .columns:nth-child(3) {
      margin-block-start: 0.8em;
    }
    .reveal blockquote {
      box-shadow: none;
    }
    .reveal .tippy-content>* {
      margin-top: 0.2em;
      margin-bottom: 0.7em;
    }
    .reveal .tippy-content>*:last-child {
      margin-bottom: 0.2em;
    }
    .reveal .slide > img.stretch.quarto-figure-center,
    .reveal .slide > img.r-stretch.quarto-figure-center {
      display: block;
      margin-left: auto;
      margin-right: auto; 
    }
    .reveal .slide > img.stretch.quarto-figure-left,
    .reveal .slide > img.r-stretch.quarto-figure-left  {
      display: block;
      margin-left: 0;
      margin-right: auto; 
    }
    .reveal .slide > img.stretch.quarto-figure-right,
    .reveal .slide > img.r-stretch.quarto-figure-right  {
      display: block;
      margin-left: auto;
      margin-right: 0; 
    }
  </style>
</head>
<body class="quarto-light">
  <div class="reveal">
    <div class="slides">

<section id="title-slide" class="quarto-title-block center">
  <h1 class="title">Test de hipótesis</h1>

<div class="quarto-title-authors">
<div class="quarto-title-author">
<div class="quarto-title-author-name">
José RTM, MSc 
</div>
</div>
</div>

</section>
<section class="slide level2">

<script>
function toggleCode(buttonElement) {
  const container = buttonElement.parentNode;  // Get parent container
  const codeBlock = container.querySelector('pre');
  
  if (codeBlock.style.display === "none" || codeBlock.style.display === "") {
    codeBlock.style.display = "block";
    buttonElement.innerHTML = "Ocultar Código";
  } else {
    codeBlock.style.display = "none";
    buttonElement.innerHTML = "Mostrar Código";
  }
}
</script>

<style>
body, .reveal .slides, .reveal .slide {
    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    color: #333;
    background: linear-gradient(to right, #e0f5ff, #f5f5f5); /* Gradient from light blue to light gray */
}

h1, h2, h3, h4, h5, h6 {
    color: #34495e;
}

a {
    color: #2980b9;
    text-decoration: underline; /* Underlining links to make them more identifiable */
}

.scrollable-slide {
    height: 100% !important;
    overflow-y: auto !important;
}

.bottom-right {
    position: absolute;
    bottom: 10px;
    right: 10px;
    width: 750px;
    height: auto;
    z-index: 1000;
}

code {
    background-color: #e8e8e8;
    border-radius: 3px;
    padding: 2px 4px;
    font-family: 'Courier New', Courier, monospace;
}

pre {
    background-color: #e8e8e8;
    border-radius: 3px;
    padding: 10px;
    overflow-x: auto;
}

button {
    background-color: #2980b9;
    color: white;
    padding: 8px 15px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.2s;
}

button:hover {
    background-color: #3498db;
}


.MathJax, .MathJax_Preview, .MathJax_Display, .mjx-chtml {
    font-size: 1.2em !important;
}
</style>
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        "HTML-CSS": {
            scale: 100,
            availableFonts: ["TeX"],
            preferredFont: "TeX",
            webFont: "TeX"
        },
        tex2jax: {
            inlineMath: [['$', '$'], ['\\(', '\\)']],
            displayMath: [['$$', '$$'], ['\\[', '\\]']],
            processEscapes: true
        }
    });
</script>
<script type="text/javascript" async="" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML">
</script>
</section>
<section id="qué-son-las-pruebas-de-hipótesis" class="slide level2">
<h2>¿Qué son las pruebas de hipótesis?</h2>
<ul>
<li><p>Hasta ahora hemos respondido la pregunta ¿Qué sé? (Inferencia)</p></li>
<li><p>Ahora comenzaremos a contestar la pregunta ¿Qué hago? (Decisión)</p></li>
<li><p>Las pruebas o contraste de hipótesis se enmarcan en la decisión entre dos acciones alternativas.</p></li>
<li><p>La idea es confrontar o poner a prueba una hipótesis previa (H0) con la información que proporcionan los datos</p></li>
<li><p><strong>¿QUÉ ES UNA HIPÓTESIS?</strong></p></li>
</ul>
</section>
<section id="hipótesis-nula-y-alternativa" class="slide level2 scrollable-slide">
<h2>Hipótesis Nula y Alternativa</h2>
<ul>
<li>La hipótesis nula (\(H_0\)) es la que queremos contrastar.</li>
<li>Es lo que sabemos de la población.</li>
<li><strong>SE ASUME COMO CIERTA</strong></li>
<li>La hipótesis alternativa (\(H_1\)) es la hipótesis del investigador/a</li>
<li>Busca reemplazar la hipótesis nula.</li>
<li>Ejemplo:
<ul>
<li>\(H_0\): 1g de paracetamol alivia el dolor de cabeza en 25 minutos.</li>
<li>\(H_1\): 500 mg de paracetamol y 600 mg de ibuprofeno alivia el dolor de cabeza en menos de 25 minutos.</li>
</ul></li>
</ul>
</section>
<section id="actividad" class="slide level2">
<h2>Actividad</h2>
<p><strong>Trabajar en filas</strong>. Se les acerca una persona en la calle. Quiere jugar con ustedes a lanzar una moneda. Si sale cara, ustedes ganan 1000, si sale sello, ustedes pierden 1000. Al jugar, perdieron 10 veces seguidas. Como no se fían de la moneda, decidieron hacer un estudio estadístico. Formular la hipótesis nula y alternativa.</p>
</section>
<section id="valor-p-o-p-value" class="slide level2">
<h2>Valor P o P-Value</h2>
<ul>
<li>Responde a la pregunta ¿Cuán inverosímil es el resultado observado si H0 fuera verdadera?</li>
<li>¿Hasta qué punto el resultado observado es probabilísticamente compatible con H0?</li>
<li>Si el valor p es muy pequeño, se establece que la probabilidad de que H0 sea cierta es muy baja dado lo que estoy observando en los datos.</li>
<li>Esto generalmente se dice en una frase “El resultado es estadísticamente significativo”.</li>
</ul>
</section>
<section id="hipótesis-alternativa-unilateral-y-bilateral" class="slide level2 scroll scrollable-slide">
<h2>Hipótesis alternativa unilateral y bilateral</h2>
<ul>
<li>La hipótesis alternativa bilateral define que los parámetros deben ser distintos.</li>
<li>Ejemplo:
<ul>
<li>\(H_0\): El paracetamol(\( P_1 \)) y el ibuprofeno(\( P_2 \)) son igual de eficaces para paliar el dolor de cabeza.</li>
<li>\(H_1\): El paracetamol(\( P_1 \)) y el ibuprofeno(\( P_2 \)) no son igual de eficaces para paliar el dolor de cabeza.</li>
</ul></li>
</ul>
<p>\[ H_0: P_1 = P_2 \] \[ H_1: P_1 ≠ P_2 \]</p>
<ul>
<li>La hipótesis alternativa unilateral define que algún parámetro es mayor o menor.</li>
<li>Ejemplo:
<ul>
<li>\(H_0\): El paracetamol(\( P_1 \)) y el ibuprofeno(\( P_2 \)) son igual de eficaces para paliar el dolor de cabeza.</li>
<li>\(H_1\): El paracetamol(\( P_1 \)) es más eficaz que el ibuprofeno(\( P_2 \)) para paliar el dolor de cabeza. \[ H_0: P_1 = P_2 \] \[ H_1: P_1 &gt; P_2 \]</li>
</ul></li>
</ul>
</section>
<section id="error-de-tipo-i-y-ii" class="slide level2">
<h2>Error de tipo I y II</h2>
<ul>
<li>Cuando trabajamos con pruebas de hipótesis podemos cometer dos tipos de error:
<ul>
<li>Error de tipo I: Rechazar \(H_0\) cuando es verdadera</li>
<li>Error de tipo II: No rechazar \(H_0\) cuando es falsa</li>
</ul></li>
</ul>
<table>
<tbody>
<tr class="odd">
<td>Decisión/Realidad</td>
<td>\(H_0\) Verdadera</td>
<td>\(H_0\) Falsa</td>
</tr>
<tr class="even">
<td>Rechazar \(H_0\)</td>
<td>Error de tipo I</td>
<td>Decisión correcta</td>
</tr>
<tr class="odd">
<td>No Rechazar \(H_0\)</td>
<td>Decisión correcta</td>
<td>Error de tipo II</td>
</tr>
</tbody>
</table>
</section>
<section id="alfa-y-beta" class="slide level2">
<h2>Alfa y Beta</h2>
<p>El nivel de significancia o alfa 𝛼 se define como la probabilidad de cometer error de tipo I. \[ 𝛼 = P(Rechazar H_0|H_0 Verdadera)\] Nota: Cuando el valor p es menor a alfa, se rechaza la hipótesis de nulidad, o la diferencia es estadísticamente significativa. Se define beta 𝛽 como la probabilidad de cometer error de tipo II. \[ 𝛽 = P(No Rechazar H_0|H_0 Falsa)\] A considerar: Para la comunidad científica cometer un error de tipo I es grave. Por eso se definen niveles de alfa de 0.05 o 0.01.</p>
</section>
<section id="poderes-extrasensoriales" class="slide level2">
<h2>Poderes extrasensoriales</h2>
<ul>
<li>En el New York Times se discutió un artículo que decía haber comprobado que las personas tienen habilidades extrasensoriales.</li>
<li><a href="https://www.nytimes.com/2011/01/06/science/06esp.html">Noticia Aquí</a></li>
<li>\(H_0\): Los poderes extrasensoriales no existen</li>
<li>\(H_1\): Los seres humanos tienen poderes extrasensoriales</li>
</ul>
<p>¿Cómo medirían eso?</p>
</section>
<section id="error-de-tipo-i" class="slide level2">
<h2>Error de tipo I</h2>
<div class="scrollable-slide">
<ul>
<li>El experimento consistía en poner dos telones en un computador, detrás de uno de esos telones había una imagen erótica (no se sabe bien por qué) que cambiaba aleatoriamente. Una posible explicación de esto es que el nivel de significancia era muy bajo para el gran tamaño de muestra que si disponía.</li>
<li>Elegir un alfa o nivel de significancia apropiado requiere un esfuerzo adicional.</li>
<li>Si vamos a tolerar un margen de error muy alto (por ejemplo 𝛼 = 0.1), corremos el riesgo de rechazar la hipótesis nula cuando en realidad es verdadera.</li>
<li>Esto se conoce como error de tipo I.</li>
<li>Mientras más bajo es el alfa, menos probable es que rechacemos H0.</li>
<li>Se puede pensar como un falso positivo→ si vas al médico, H0 es que no estás enferm@, pero te hacen exámenes para comprobarlo. Si los exámenes salen positivos, rechazamos \(H_0\), pero puede ocurrir que tengas un test positivo estando san@.</li>
</ul>
</div>
</section>
<section id="spam" class="slide level2">
<h2>SPAM</h2>
<ul>
<li><p>Pensemos en el spam</p></li>
<li><p>\(H_0\): El correo no es spam</p></li>
<li><p>Para testear esto, ustedes tienen un filtro de spam que busca algunas palabras clave como por ejemplo: “Aprovecha”, “oferta”,etc.</p></li>
<li><p>¿Cuál sería el error de tipo I (falso positivo)?</p></li>
<li><p>¿Cuál sería el error de tipo II (falso negativo)?</p></li>
</ul>
</section>
<section id="testeo-de-cáncer" class="slide level2">
<h2>Testeo de Cáncer</h2>
<p>\(H_0\): La persona no tiene cáncer Los test diagnósticos buscan probar \(H_0\).</p>
<ul>
<li>¿Cuál sería el error de tipo I (falso positivo)?</li>
<li>¿Cuál sería el error de tipo II (falso negativo)?</li>
</ul>
<p>¿Cuál sería mejor?</p>
</section>
<section id="pasos-para-contrastar-una-hipótesis" class="slide level2">
<h2>Pasos para contrastar una hipótesis</h2>
<ul>
<li><p>Formular dos hipótesis H0 (Hipótesis nula o de nulidad) y H1 (Hipótesis alternativa).</p></li>
<li><p>Construir un estadístico de prueba a partir de la muestra de observaciones e identificar su distribución muestral bajo la hipótesis de nulidad</p></li>
<li><p>Derivar una regla de decisión y elegir una de las dos hipótesis en base a la evidencia de una muestra. La regla de decisión es la siguiente:</p>
<p><strong>“Rechazar H0” o “No rechazar H0”</strong></p></li>
</ul>
</section>
<section id="ejercicio" class="slide level2">
<h2>Ejercicio</h2>
<p>Hasta el año 2000, al 30% de la gente le gustaba el centella. ¿Utilizando un alfa del 5%, se puede afirmar que este porcentaje incrementó en la actualidad? Para responder esto, sacamos una muestra de 50 personas, de las cuales 22 declaró que le gusta el centella.</p>
<ul>
<li>Escribir \(H_0\)</li>
<li>¿\(H_1\) es bilateral o unilateral?</li>
</ul>
</section>
<section id="test-de-una-proporción" class="slide level2">
<h2>Test de una proporción</h2>
<p><span class="math display">\[
Z = \frac{\hat{p} - p_0}{\sqrt{\frac{p_0(1-p_0)}{n}}} \sim N(0,1)
\]</span> <span class="math display">\[
p_0 = \text{Proporción de } H_0
\]</span> Ejercicio: Identificar todos los elementos de la ecuación en el ejercicio.</p>
</section>
<section id="procedimiento-en-r" class="slide level2">
<h2>Procedimiento en R</h2>
<div class="cell">
<div class="sourceCode cell-code" id="cb1"><pre class="sourceCode numberSource r number-lines code-with-copy"><code class="sourceCode r"><span id="cb1-1"><a href="#cb1-1"></a><span class="fu">prop.test</span>(<span class="dv">22</span>, <span class="dv">50</span>, <span class="at">p=</span><span class="fl">0.3</span>, <span class="at">alternative=</span><span class="st">"greater"</span>, <span class="at">conf.level=</span><span class="fl">0.95</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>
    1-sample proportions test with continuity correction

data:  22 out of 50, null probability 0.3
X-squared = 4.0238, df = 1, p-value = 0.02243
alternative hypothesis: true p is greater than 0.3
95 percent confidence interval:
 0.3213673 1.0000000
sample estimates:
   p 
0.44 </code></pre>
</div>
</div>
</section>
<section id="ejercicio-final" class="slide level2">
<h2>Ejercicio Final</h2>
<ul>
<li>La tasa de letalidad de la fiebre tifoidea antes del uso de la cloromicetina era de 10%.</li>
<li>Para probar la eficacia de este medicamento se tomo una muestra de 100 pacientes a los cuales se les trató con cloromicetina.</li>
<li>De este grupo, fallecieron por fiebre tifoidea solamente 2 personas.</li>
<li>Basándose en esta experiencia y utilizando un nivel de significancia del 5%, ¿Se puede afirmar que la cloromicetina disminuye la tasa de letalidad por fiebre tifoidea?</li>
</ul>
</section>
<section id="procedimiento-en-r-1" class="slide level2">
<h2>Procedimiento en R</h2>
<div class="cell">
<div class="sourceCode cell-code" id="cb3"><pre class="sourceCode numberSource r number-lines code-with-copy"><code class="sourceCode r"><span id="cb3-1"><a href="#cb3-1"></a><span class="fu">prop.test</span>(<span class="dv">2</span>, <span class="dv">100</span>, <span class="at">p=</span><span class="fl">0.1</span>, <span class="at">alternative=</span><span class="st">"less"</span>, <span class="at">conf.level=</span><span class="fl">0.95</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>
    1-sample proportions test with continuity correction

data:  2 out of 100, null probability 0.1
X-squared = 6.25, df = 1, p-value = 0.00621
alternative hypothesis: true p is less than 0.1
95 percent confidence interval:
 0.00000000 0.06577361
sample estimates:
   p 
0.02 </code></pre>
</div>
</div>
</section>
<section id="la-función-prop.testtambién-sirve-para-calcular-ic" class="slide level2 scrollable-slide">
<h2>La función <code>prop.test()</code>también sirve para calcular IC</h2>
<ul>
<li>Supongamos que queremos un IC95% de la prevalencia de diabetes. En una muestra encontramos que 14 de 100 personas tenían diabetes.</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb5"><pre class="sourceCode numberSource r number-lines code-with-copy"><code class="sourceCode r"><span id="cb5-1"><a href="#cb5-1"></a><span class="fu">prop.test</span>(<span class="dv">14</span>, <span class="dv">100</span>, <span class="at">alternative=</span><span class="st">"two.sided"</span>, <span class="at">conf.level=</span><span class="fl">0.95</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>
    1-sample proportions test with continuity correction

data:  14 out of 100, null probability 0.5
X-squared = 50.41, df = 1, p-value = 1.248e-12
alternative hypothesis: true p is not equal to 0.5
95 percent confidence interval:
 0.08140392 0.22711629
sample estimates:
   p 
0.14 </code></pre>
</div>
</div>
</section>
<div class="footer footer-default">

</div>
    </div>
  </div>

  <script>window.backupDefine = window.define; window.define = undefined;</script>
  <script src="Test de hipótesis_files/libs/revealjs/dist/reveal.js"></script>
  <!-- reveal.js plugins -->
  <script src="Test de hipótesis_files/libs/revealjs/plugin/quarto-line-highlight/line-highlight.js"></script>
  <script src="Test de hipótesis_files/libs/revealjs/plugin/pdf-export/pdfexport.js"></script>
  <script src="Test de hipótesis_files/libs/revealjs/plugin/reveal-menu/menu.js"></script>
  <script src="Test de hipótesis_files/libs/revealjs/plugin/reveal-menu/quarto-menu.js"></script>
  <script src="Test de hipótesis_files/libs/revealjs/plugin/quarto-support/support.js"></script>
  

  <script src="Test de hipótesis_files/libs/revealjs/plugin/notes/notes.js"></script>
  <script src="Test de hipótesis_files/libs/revealjs/plugin/search/search.js"></script>
  <script src="Test de hipótesis_files/libs/revealjs/plugin/zoom/zoom.js"></script>
  <script src="Test de hipótesis_files/libs/revealjs/plugin/math/math.js"></script>
  <script>window.define = window.backupDefine; window.backupDefine = undefined;</script>

  <script>

      // Full list of configuration options available at:
      // https://revealjs.com/config/
      Reveal.initialize({
'controlsAuto': true,
'previewLinksAuto': false,
'smaller': false,
'pdfSeparateFragments': false,
'autoAnimateEasing': "ease",
'autoAnimateDuration': 1,
'autoAnimateUnmatched': true,
'menu': {"side":"left","useTextContentForMissingTitles":true,"markers":false,"loadIcons":false,"custom":[{"title":"Tools","icon":"<i class=\"fas fa-gear\"></i>","content":"<ul class=\"slide-menu-items\">\n<li class=\"slide-tool-item active\" data-item=\"0\"><a href=\"#\" onclick=\"RevealMenuToolHandlers.fullscreen(event)\"><kbd>f</kbd> Fullscreen</a></li>\n<li class=\"slide-tool-item\" data-item=\"1\"><a href=\"#\" onclick=\"RevealMenuToolHandlers.speakerMode(event)\"><kbd>s</kbd> Speaker View</a></li>\n<li class=\"slide-tool-item\" data-item=\"2\"><a href=\"#\" onclick=\"RevealMenuToolHandlers.overview(event)\"><kbd>o</kbd> Slide Overview</a></li>\n<li class=\"slide-tool-item\" data-item=\"3\"><a href=\"#\" onclick=\"RevealMenuToolHandlers.overview(event)\"><kbd>e</kbd> PDF Export Mode</a></li>\n<li class=\"slide-tool-item\" data-item=\"4\"><a href=\"#\" onclick=\"RevealMenuToolHandlers.keyboardHelp(event)\"><kbd>?</kbd> Keyboard Help</a></li>\n</ul>"}],"openButton":true},
'smaller': false,
 
        // Display controls in the bottom right corner
        controls: false,

        // Help the user learn the controls by providing hints, for example by
        // bouncing the down arrow when they first encounter a vertical slide
        controlsTutorial: false,

        // Determines where controls appear, "edges" or "bottom-right"
        controlsLayout: 'edges',

        // Visibility rule for backwards navigation arrows; "faded", "hidden"
        // or "visible"
        controlsBackArrows: 'faded',

        // Display a presentation progress bar
        progress: true,

        // Display the page number of the current slide
        slideNumber: false,

        // 'all', 'print', or 'speaker'
        showSlideNumber: 'all',

        // Add the current slide number to the URL hash so that reloading the
        // page/copying the URL will return you to the same slide
        hash: true,

        // Start with 1 for the hash rather than 0
        hashOneBasedIndex: false,

        // Flags if we should monitor the hash and change slides accordingly
        respondToHashChanges: true,

        // Push each slide change to the browser history
        history: true,

        // Enable keyboard shortcuts for navigation
        keyboard: true,

        // Enable the slide overview mode
        overview: true,

        // Disables the default reveal.js slide layout (scaling and centering)
        // so that you can use custom CSS layout
        disableLayout: false,

        // Vertical centering of slides
        center: false,

        // Enables touch navigation on devices with touch input
        touch: true,

        // Loop the presentation
        loop: false,

        // Change the presentation direction to be RTL
        rtl: false,

        // see https://revealjs.com/vertical-slides/#navigation-mode
        navigationMode: 'linear',

        // Randomizes the order of slides each time the presentation loads
        shuffle: false,

        // Turns fragments on and off globally
        fragments: true,

        // Flags whether to include the current fragment in the URL,
        // so that reloading brings you to the same fragment position
        fragmentInURL: false,

        // Flags if the presentation is running in an embedded mode,
        // i.e. contained within a limited portion of the screen
        embedded: false,

        // Flags if we should show a help overlay when the questionmark
        // key is pressed
        help: true,

        // Flags if it should be possible to pause the presentation (blackout)
        pause: true,

        // Flags if speaker notes should be visible to all viewers
        showNotes: false,

        // Global override for autoplaying embedded media (null/true/false)
        autoPlayMedia: null,

        // Global override for preloading lazy-loaded iframes (null/true/false)
        preloadIframes: null,

        // Number of milliseconds between automatically proceeding to the
        // next slide, disabled when set to 0, this value can be overwritten
        // by using a data-autoslide attribute on your slides
        autoSlide: 0,

        // Stop auto-sliding after user input
        autoSlideStoppable: true,

        // Use this method for navigation when auto-sliding
        autoSlideMethod: null,

        // Specify the average time in seconds that you think you will spend
        // presenting each slide. This is used to show a pacing timer in the
        // speaker view
        defaultTiming: null,

        // Enable slide navigation via mouse wheel
        mouseWheel: false,

        // The display mode that will be used to show slides
        display: 'block',

        // Hide cursor if inactive
        hideInactiveCursor: true,

        // Time before the cursor is hidden (in ms)
        hideCursorTime: 5000,

        // Opens links in an iframe preview overlay
        previewLinks: false,

        // Transition style (none/fade/slide/convex/concave/zoom)
        transition: 'none',

        // Transition speed (default/fast/slow)
        transitionSpeed: 'default',

        // Transition style for full page slide backgrounds
        // (none/fade/slide/convex/concave/zoom)
        backgroundTransition: 'none',

        // Number of slides away from the current that are visible
        viewDistance: 3,

        // Number of slides away from the current that are visible on mobile
        // devices. It is advisable to set this to a lower number than
        // viewDistance in order to save resources.
        mobileViewDistance: 2,

        // The "normal" size of the presentation, aspect ratio will be preserved
        // when the presentation is scaled to fit different resolutions. Can be
        // specified using percentage units.
        width: 1050,

        height: 700,

        // Factor of the display size that should remain empty around the content
        margin: 0.1,

        math: {
          mathjax: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js',
          config: 'TeX-AMS_HTML-full',
          tex2jax: {
            inlineMath: [['\\(','\\)']],
            displayMath: [['\\[','\\]']],
            balanceBraces: true,
            processEscapes: false,
            processRefs: true,
            processEnvironments: true,
            preview: 'TeX',
            skipTags: ['script','noscript','style','textarea','pre','code'],
            ignoreClass: 'tex2jax_ignore',
            processClass: 'tex2jax_process'
          },
        },

        // reveal.js plugins
        plugins: [QuartoLineHighlight, PdfExport, RevealMenu, QuartoSupport,

          RevealMath,
          RevealNotes,
          RevealSearch,
          RevealZoom
        ]
      });
    </script>
    
    <script>
      // htmlwidgets need to know to resize themselves when slides are shown/hidden.
      // Fire the "slideenter" event (handled by htmlwidgets.js) when the current
      // slide changes (different for each slide format).
      (function () {
        // dispatch for htmlwidgets
        function fireSlideEnter() {
          const event = window.document.createEvent("Event");
          event.initEvent("slideenter", true, true);
          window.document.dispatchEvent(event);
        }

        function fireSlideChanged(previousSlide, currentSlide) {
          fireSlideEnter();

          // dispatch for shiny
          if (window.jQuery) {
            if (previousSlide) {
              window.jQuery(previousSlide).trigger("hidden");
            }
            if (currentSlide) {
              window.jQuery(currentSlide).trigger("shown");
            }
          }
        }

        // hookup for slidy
        if (window.w3c_slidy) {
          window.w3c_slidy.add_observer(function (slide_num) {
            // slide_num starts at position 1
            fireSlideChanged(null, w3c_slidy.slides[slide_num - 1]);
          });
        }

      })();
    </script>

    <script id="quarto-html-after-body" type="application/javascript">
    window.document.addEventListener("DOMContentLoaded", function (event) {
      const toggleBodyColorMode = (bsSheetEl) => {
        const mode = bsSheetEl.getAttribute("data-mode");
        const bodyEl = window.document.querySelector("body");
        if (mode === "dark") {
          bodyEl.classList.add("quarto-dark");
          bodyEl.classList.remove("quarto-light");
        } else {
          bodyEl.classList.add("quarto-light");
          bodyEl.classList.remove("quarto-dark");
        }
      }
      const toggleBodyColorPrimary = () => {
        const bsSheetEl = window.document.querySelector("link#quarto-bootstrap");
        if (bsSheetEl) {
          toggleBodyColorMode(bsSheetEl);
        }
      }
      toggleBodyColorPrimary();  
      const tabsets =  window.document.querySelectorAll(".panel-tabset-tabby")
      tabsets.forEach(function(tabset) {
        const tabby = new Tabby('#' + tabset.id);
      });
      const clipboard = new window.ClipboardJS('.code-copy-button', {
        target: function(trigger) {
          return trigger.previousElementSibling;
        }
      });
      clipboard.on('success', function(e) {
        // button target
        const button = e.trigger;
        // don't keep focus
        button.blur();
        // flash "checked"
        button.classList.add('code-copy-button-checked');
        var currentTitle = button.getAttribute("title");
        button.setAttribute("title", "Copied!");
        let tooltip;
        if (window.bootstrap) {
          button.setAttribute("data-bs-toggle", "tooltip");
          button.setAttribute("data-bs-placement", "left");
          button.setAttribute("data-bs-title", "Copied!");
          tooltip = new bootstrap.Tooltip(button, 
            { trigger: "manual", 
              customClass: "code-copy-button-tooltip",
              offset: [0, -8]});
          tooltip.show();    
        }
        setTimeout(function() {
          if (tooltip) {
            tooltip.hide();
            button.removeAttribute("data-bs-title");
            button.removeAttribute("data-bs-toggle");
            button.removeAttribute("data-bs-placement");
          }
          button.setAttribute("title", currentTitle);
          button.classList.remove('code-copy-button-checked');
        }, 1000);
        // clear code selection
        e.clearSelection();
      });
      function tippyHover(el, contentFn) {
        const config = {
          allowHTML: true,
          content: contentFn,
          maxWidth: 500,
          delay: 100,
          arrow: false,
          appendTo: function(el) {
              return el.closest('section.slide') || el.parentElement;
          },
          interactive: true,
          interactiveBorder: 10,
          theme: 'quarto-reveal',
          placement: 'bottom-start'
        };
          config['offset'] = [0,0];
          config['maxWidth'] = 700;
        window.tippy(el, config); 
      }
      const noterefs = window.document.querySelectorAll('a[role="doc-noteref"]');
      for (var i=0; i<noterefs.length; i++) {
        const ref = noterefs[i];
        tippyHover(ref, function() {
          // use id or data attribute instead here
          let href = ref.getAttribute('data-footnote-href') || ref.getAttribute('href');
          try { href = new URL(href).hash; } catch {}
          const id = href.replace(/^#\/?/, "");
          const note = window.document.getElementById(id);
          return note.innerHTML;
        });
      }
      const findCites = (el) => {
        const parentEl = el.parentElement;
        if (parentEl) {
          const cites = parentEl.dataset.cites;
          if (cites) {
            return {
              el,
              cites: cites.split(' ')
            };
          } else {
            return findCites(el.parentElement)
          }
        } else {
          return undefined;
        }
      };
      var bibliorefs = window.document.querySelectorAll('a[role="doc-biblioref"]');
      for (var i=0; i<bibliorefs.length; i++) {
        const ref = bibliorefs[i];
        const citeInfo = findCites(ref);
        if (citeInfo) {
          tippyHover(citeInfo.el, function() {
            var popup = window.document.createElement('div');
            citeInfo.cites.forEach(function(cite) {
              var citeDiv = window.document.createElement('div');
              citeDiv.classList.add('hanging-indent');
              citeDiv.classList.add('csl-entry');
              var biblioDiv = window.document.getElementById('ref-' + cite);
              if (biblioDiv) {
                citeDiv.innerHTML = biblioDiv.innerHTML;
              }
              popup.appendChild(citeDiv);
            });
            return popup.innerHTML;
          });
        }
      }
    });
    </script>
    

</body></html>
