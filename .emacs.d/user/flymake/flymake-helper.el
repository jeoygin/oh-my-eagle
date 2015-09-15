<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: flymake-helper.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=flymake-helper.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: flymake-helper.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=flymake-helper.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for flymake-helper.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=flymake-helper.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<br /><span class="specialdays">Paraguay, National Day</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22flymake-helper.el%22">flymake-helper.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="download/flymake-helper.el">Download</a></p><pre class="code"><span class="linecomment">;;; flymake-helper.el -- flymake helper methods</span>

<span class="linecomment">;; Copyright (C) 2004 Free Software Foundation</span>

<span class="linecomment">;; Author: Nascif A. Abousalh Neto &lt;nascif at acm dot org&gt;</span>
<span class="linecomment">;; Maintainer: Nascif A. Abousalh Neto &lt;nascif at acm.org&gt;</span>
<span class="linecomment">;; Keywords: java, syntax checker, tools</span>
<span class="linecomment">;; Time-stamp: &lt;2005-01-27 10:21:18 naabou&gt;</span>
<span class="linecomment">;; Version: 0.1</span>

<span class="linecomment">;; This program is free software; you can redistribute it and/or</span>
<span class="linecomment">;; modify it under the terms of the GNU General Public License</span>
<span class="linecomment">;; as published by the Free Software Foundation; either version 2</span>
<span class="linecomment">;; of the License, or (at your option) any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; if not, write to the Free Software</span>
<span class="linecomment">;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111, USA.</span>

<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This module provides extensions to Flymake, created by Pavel Kobiakov</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Usage:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1) Download and install flymake from </span>
<span class="linecomment">;;    http://flymake.sourceforge.net/</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; 2) Add flymake-helper.el to a directory in your load-path</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 3) Add somewhere in your .emacs</span>
<span class="linecomment">;;    (require 'flymake-helper)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Acknowledgements:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; ChangeLog:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  0.2 - Adds flymakeh-open-compilation (thanks to Ole Arndt)</span>
<span class="linecomment">;;      - Changes prefix to "flymakeh" to prevent name collisions with the official flymake defuns.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  0.1 - Initial version: defines flymake-save-as-kill-err-messages-for-current-line</span>

(require 'flymake)

<span class="linecomment">; flymake helpers</span>
(defun flymakeh-save-as-kill-err-messages-for-current-line()
  "<span class="quote">Add to kill ring errors/warnings for current line. Also display error/warnings as Emacs messages (on the minibuffer)</span>"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info (flymake-get-buffer-err-info (current-buffer)) line-no))))
    (flymakeh-save-as-kill-err-data line-err-info-list)
  ))

(defun flymakeh-save-as-kill-err-data(line-err-info-list)
  "<span class="quote">Save a list with errors/warnings from line-err-info in the kill ring.
   Also displays them as messages</span>"
  (when line-err-info-list
    (mapcar 'flymakeh-kill-data-from-err-entry line-err-info-list)
    )
  )

(defun flymakeh-kill-data-from-err-entry (line-err-info-entry)
  (let ((err-entry-text (flymake-ler-get-text      line-err-info-entry)))
    (kill-new err-entry-text)
    (message err-entry-text)))


(defun flymakeh-open-compilation (&optional other-files)
  "<span class="quote">Open Flymake errors in a compilation buffer.
Shows only errors for the current buffer.
With the optional prefix argument it also shows messages for other files.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((errs (flymake-get-buffer-err-info (current-buffer)))
	(buf-name (buffer-name))
	(comp-buffer (get-buffer-create "<span class="quote">*compilation*</span>")))
    (switch-to-buffer-other-window comp-buffer)
    (setq buffer-read-only nil)
    (erase-buffer)
    (if (null errs)
	(insert "<span class="quote">\nCompilation finished at </span>" (current-time-string) "<span class="quote">\n</span>")
      (dolist (fileline errs)
	(dolist (errmsg (cadr fileline))
	  (let ((file (nth 0 errmsg))
		(line (nth 1 errmsg))
		(severity (nth 2 errmsg))
		(msg (nth 3 errmsg))
		(path (nth 4 errmsg)))
	    (if (and (or other-files (null file)) (&gt; line 0))
		(insert path "<span class="quote">:</span>" (number-to-string line) "<span class="quote">:</span>"
			(replace-regexp-in-string "<span class="quote">\\`[:0-9]+: \\(Semantic \\|Syntax \\)*</span>" "<span class="quote"></span>" msg)
			"<span class="quote">\n</span>")))))
      (insert "<span class="quote">\nCompilation exited abnormally with code 1 at </span>"
	      (current-time-string) "<span class="quote">\n</span>"))
    (compilation-mode)
    (next-error 0 t)))


(provide 'flymake-helper)

<span class="linecomment">; flymake-helper ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=flymake-helper.el;missing=de_en_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_flymake-helper.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=flymake-helper.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=flymake-helper.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=flymake-helper.el">Administration</a></span><!-- test --><span class="time"><br /> Last edited 2005-10-13 17:56 UTC by <a class="author" title="from 217-162-112-104.dclient.hispeed.ch" href="http://www.emacswiki.org/emacs/AlexSchroeder">AlexSchroeder</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=flymake-helper.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
