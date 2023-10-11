<!DOCTYPE html>
<!-- saved from url=(0082)https://www.gnu.org/software/emacs/manual/html_node/elisp/Special-Read-Syntax.html -->
<html><!-- Created by GNU Texinfo 7.0.3, https://www.gnu.org/software/texinfo/ --><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Special Read Syntax (GNU Emacs Lisp Reference Manual)</title>

<meta name="description" content="Special Read Syntax (GNU Emacs Lisp Reference Manual)">
<meta name="keywords" content="Special Read Syntax (GNU Emacs Lisp Reference Manual)">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="makeinfo">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rev="made" href="mailto:bug-gnu-emacs@gnu.org">
<link rel="icon" type="image/png" href="https://www.gnu.org/graphics/gnu-head-mini.png">
<meta name="ICBM" content="42.256233,-71.006581">
<meta name="DC.title" content="gnu.org">
<style type="text/css">
@import url('/software/emacs/manual.css');
</style>
</head>

<body lang="en">
<div class="section-level-extent" id="Special-Read-Syntax">
<div class="nav-panel">
<p>
Next: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Comments.html" accesskey="n" rel="next">Comments</a>, Previous: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Printed-Representation.html" accesskey="p" rel="prev">Printed Representation and Read Syntax</a>, Up: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Lisp-Data-Types.html" accesskey="u" rel="up">Lisp Data Types</a> &nbsp; [<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html" title="Index" rel="index">Index</a>]</p>
</div>
<hr>
<h3 class="section" id="Special-Read-Syntax-1">2.2 Special Read Syntax</h3>
<a class="index-entry-id" id="index-special-read-syntax"></a>

<p>Emacs Lisp represents many special objects and constructs via
special hash notations.
</p>
<dl class="table">
<dt>‘<samp class="samp">#&lt;…&gt;</samp>’</dt>
<dd><p>Objects that have no read syntax are presented like this
(see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Printed-Representation.html">Printed Representation and Read Syntax</a>).
</p>
</dd>
<dt>‘<samp class="samp">##</samp>’</dt>
<dd><p>The printed representation of an interned symbol whose name is an
empty string (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Symbol-Type.html">Symbol Type</a>).
</p>
</dd>
<dt>‘<samp class="samp">#'</samp>’</dt>
<dd><p>This is a shortcut for <code class="code">function</code>, see <a class="ref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Anonymous-Functions.html">Anonymous Functions</a>.
</p>
</dd>
<dt>‘<samp class="samp">#:</samp>’</dt>
<dd><p>The printed representation of an uninterned symbol whose name is
<var class="var">foo</var> is ‘<samp class="samp">#:<var class="var">foo</var></samp>’ (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Symbol-Type.html">Symbol Type</a>).
</p>
</dd>
<dt>‘<samp class="samp">#N</samp>’</dt>
<dd><p>When printing circular structures, this construct is used to represent
where the structure loops back onto itself, and ‘<samp class="samp">N</samp>’ is the
starting list count:
</p>
<div class="example lisp">
<pre class="lisp-preformatted">(let ((a (list 1)))
  (setcdr a a))
=&gt; (1 . #0)
</pre></div>

</dd>
<dt>‘<samp class="samp">#N=</samp>’</dt>
<dt>‘<samp class="samp">#N#</samp>’</dt>
<dd><p>‘<samp class="samp">#N=</samp>’ gives the name to an object, and ‘<samp class="samp">#N#</samp>’ represents that
object, so when reading back the object, they will be the same object
instead of copies (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Circular-Objects.html">Read Syntax for Circular Objects</a>).
</p>
</dd>
<dt>‘<samp class="samp">#xN</samp>’</dt>
<dd><p>‘<samp class="samp">N</samp>’ represented as a hexadecimal number (‘<samp class="samp">#x2a</samp>’).
</p>
</dd>
<dt>‘<samp class="samp">#oN</samp>’</dt>
<dd><p>‘<samp class="samp">N</samp>’ represented as an octal number (‘<samp class="samp">#o52</samp>’).
</p>
</dd>
<dt>‘<samp class="samp">#bN</samp>’</dt>
<dd><p>‘<samp class="samp">N</samp>’ represented as a binary number (‘<samp class="samp">#b101010</samp>’).
</p>
</dd>
<dt>‘<samp class="samp">#(…)</samp>’</dt>
<dd><p>String text properties (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Text-Props-and-Strings.html">Text Properties in Strings</a>).
</p>
</dd>
<dt>‘<samp class="samp">#^</samp>’</dt>
<dd><p>A char table (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Char_002dTable-Type.html">Char-Table Type</a>).
</p>
</dd>
<dt>‘<samp class="samp">#s(hash-table …)</samp>’</dt>
<dd><p>A hash table (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Hash-Table-Type.html">Hash Table Type</a>).
</p>
</dd>
<dt>‘<samp class="samp">?C</samp>’</dt>
<dd><p>A character (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Basic-Char-Syntax.html">Basic Char Syntax</a>).
</p>
</dd>
<dt>‘<samp class="samp">#$</samp>’</dt>
<dd><p>The current file name in byte-compiled files (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Docs-and-Compilation.html">Documentation Strings and Compilation</a>).  This is not meant to be used in Emacs Lisp source
files.
</p>
</dd>
<dt>‘<samp class="samp">#@N</samp>’</dt>
<dd><p>Skip the next ‘<samp class="samp">N</samp>’ characters (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Comments.html">Comments</a>).  This is used in
byte-compiled files, and is not meant to be used in Emacs Lisp source
files.
</p>
</dd>
<dt>‘<samp class="samp">#f</samp>’</dt>
<dd><p>Indicates that the following form isn’t readable by the Emacs Lisp
reader.  This is only in text for display purposes (when that would
look prettier than alternative ways of indicating an unreadable form)
and will never appear in any Lisp file.
</p></dd>
</dl>


</div>
<hr>
<div class="nav-panel">
<p>
Next: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Comments.html">Comments</a>, Previous: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Printed-Representation.html">Printed Representation and Read Syntax</a>, Up: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Lisp-Data-Types.html">Lisp Data Types</a> &nbsp; [<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html" title="Index" rel="index">Index</a>]</p>
</div>





</body></html>