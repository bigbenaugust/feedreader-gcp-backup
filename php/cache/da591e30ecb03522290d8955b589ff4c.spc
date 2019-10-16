a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"The Daily WTF";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:23:"http://thedailywtf.com/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:45:"Curious Perversions in Information Technology";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 16 Oct 2019 17:55:17 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"CodeSOD: The Replacements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://thedailywtf.com/articles/the-replacements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 16 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:49:"https://thedailywtf.com/articles/the-replacements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2653:"<p>Nobody wants to have a <a href="https://www.xkcd.com/327/">Bobby Tables</a> moment in their database. So we need to to sanitize our inputs. <strong>Ted C</strong> noticed a bunch of stored procedures which contained lines like this:</p>
<pre><code class="sql">  @scrubbed = fn_ScrubInput(fn_ScrubInput(@input))</code></pre>

<p>Obviously, they wanted to be <em>super</em> careful, and make sure their inputs were clean. But it got Ted curious, so he checked out how the function was implemented. The function body had one line, the <code>RETURN</code> line, which looked like this:</p>
<pre><code class="sql">  RETURN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@input, &#39;&#34;&#39;, &#39;&#34;&#39;), 
&#39;*&#39;, &#39;\*&#39;),&#39;~&#39;, &#39;\~&#39;), &#39;@&#39;, &#39;\@&#39;), &#39;#&#39;, 
&#39;\#&#39;), &#39;$&#39;,&#39;\$&#39;),&#39;%&#39;,&#39;\%&#39;),&#39;^&#39;,&#39;\^&#39;),
&#39;&amp;&#39;,&#39;\&amp;&#39;),&#39;(&#39;,&#39;\(&#39;),&#39;)&#39;,&#39;\)&#39;),
&#39;_&#39;,&#39;\_&#39;),&#39;+&#39;,&#39;\+&#39;),&#39;=&#39;,&#39;\=&#39;),&#39;&gt;&#39;,
&#39;\&gt;&#39;),&#39;&lt;&#39;,&#39;\&lt;&#39;),&#39;?&#39;,&#39;\?&#39;),&#39;/&#39;,
&#39;\/&#39;)</code></pre>

<p>Whitespace added.</p>

<p>Ted REPLACE REPLACE REPLACEd this with a call to the built-in <code>STRING_ESCAPE</code> function, which handled the escaping they needed.</p>
<!-- Easy Reader Version: I'm just on a kick with these nested calls this week, I guess -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script><div>
	<img src="https://thedailywtf.com/images/footer/raygun50.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Forget logs. Next time you&#39;re struggling to replicate error, crash and performance issues in your apps - Think <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Raygun</a>! Installs in minutes. <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Learn more.</a>
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=Ce6WF3GzqIE:hsfrEumEfT4:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/Ce6WF3GzqIE" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"20";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:58:"https://thedailywtf.com/articles/comments/the-replacements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"CodeSOD: Cast Away";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"https://thedailywtf.com/articles/cast-away";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 15 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:42:"https://thedailywtf.com/articles/cast-away";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:7826:"<p>The accountants at <strong>Gary</strong>&#39;s company had a problem: sometimes, when they wanted to check the price to ship a carton of product, that price was zero. No one had, as of yet, <em>actually</em> shipped product for free, but they needed to understand why certain cartons were showing up as having zero cost.</p>
<p>The table which tracks this, <code>CartonFee</code>, has three fields: <code>ID</code>, <code>Carton</code>, and <code>Cost</code>. Carton names are unique, and things like <code>12x3x6</code>, or <code>Box1</code>, or even <code>Large box</code>. So, given a carton name, it should be pretty easy to update the cost, yes? The stored procedure which does this, <code>spQuickBooks_UpdateCartonCost</code> should be pretty simple.</p>
<pre><code class="language-sql"><div><span class="hljs-keyword">ALTER</span> <span class="hljs-keyword">PROCEDURE</span> [dbo].[spQuickBooks_UpdateCartonCost]
	@Carton <span class="hljs-built_in">varchar</span>(<span class="hljs-number">100</span>),
	@Fee <span class="hljs-built_in">decimal</span>(<span class="hljs-number">6</span>,<span class="hljs-number">2</span>)
<span class="hljs-keyword">AS</span>
<span class="hljs-keyword">BEGIN</span>
	
	<span class="hljs-keyword">DECLARE</span> @<span class="hljs-keyword">Cost</span> <span class="hljs-built_in">decimal</span>(<span class="hljs-number">8</span>,<span class="hljs-number">3</span>) = <span class="hljs-keyword">LEFT</span>(<span class="hljs-keyword">CAST</span>(<span class="hljs-keyword">CAST</span>((<span class="hljs-keyword">CAST</span>(@Fee <span class="hljs-keyword">AS</span> <span class="hljs-built_in">NUMERIC</span>(<span class="hljs-number">36</span>,<span class="hljs-number">3</span>))/<span class="hljs-number">140</span>) * <span class="hljs-number">100</span> <span class="hljs-keyword">AS</span> <span class="hljs-built_in">NUMERIC</span>(<span class="hljs-number">36</span>,<span class="hljs-number">3</span>)) <span class="hljs-keyword">AS</span> <span class="hljs-built_in">VARCHAR</span>), 
		<span class="hljs-keyword">LEN</span>(<span class="hljs-keyword">CAST</span>(<span class="hljs-keyword">CAST</span>((<span class="hljs-keyword">CAST</span>(@Fee <span class="hljs-keyword">AS</span> <span class="hljs-built_in">NUMERIC</span>(<span class="hljs-number">36</span>,<span class="hljs-number">3</span>))/<span class="hljs-number">140</span>) * <span class="hljs-number">100</span> <span class="hljs-keyword">AS</span> <span class="hljs-built_in">NUMERIC</span>(<span class="hljs-number">36</span>,<span class="hljs-number">3</span>)) <span class="hljs-keyword">AS</span> <span class="hljs-built_in">VARCHAR</span>)) - <span class="hljs-number">1</span>) 
		+ <span class="hljs-keyword">CASE</span> <span class="hljs-keyword">WHEN</span> <span class="hljs-keyword">RIGHT</span>(<span class="hljs-keyword">LEFT</span>(<span class="hljs-keyword">CAST</span>(<span class="hljs-keyword">CAST</span>((<span class="hljs-keyword">CAST</span>(@Fee <span class="hljs-keyword">AS</span> <span class="hljs-built_in">NUMERIC</span>(<span class="hljs-number">36</span>,<span class="hljs-number">3</span>))/<span class="hljs-number">140</span>) * <span class="hljs-number">100</span> <span class="hljs-keyword">AS</span> <span class="hljs-built_in">NUMERIC</span>(<span class="hljs-number">36</span>,<span class="hljs-number">4</span>)) <span class="hljs-keyword">AS</span> <span class="hljs-built_in">VARCHAR</span>),
			<span class="hljs-keyword">LEN</span>(<span class="hljs-keyword">CAST</span>(<span class="hljs-keyword">CAST</span>((<span class="hljs-keyword">CAST</span>(@Fee <span class="hljs-keyword">AS</span> <span class="hljs-built_in">NUMERIC</span>(<span class="hljs-number">36</span>,<span class="hljs-number">3</span>))/<span class="hljs-number">140</span>) * <span class="hljs-number">100</span> <span class="hljs-keyword">AS</span> <span class="hljs-built_in">NUMERIC</span>(<span class="hljs-number">36</span>,<span class="hljs-number">4</span>)) <span class="hljs-keyword">AS</span> <span class="hljs-built_in">VARCHAR</span>)) - <span class="hljs-number">1</span>), <span class="hljs-number">1</span>) &gt; <span class="hljs-number">5</span> 
		<span class="hljs-keyword">THEN</span> <span class="hljs-string">&#39;5&#39;</span> <span class="hljs-keyword">ELSE</span> <span class="hljs-string">&#39;0&#39;</span> <span class="hljs-keyword">END</span>

	<span class="hljs-keyword">IF</span> <span class="hljs-keyword">NOT</span> <span class="hljs-keyword">EXISTS</span> (<span class="hljs-keyword">SELECT</span> <span class="hljs-number">1</span> <span class="hljs-keyword">FROM</span> CartonFee <span class="hljs-keyword">WHERE</span> Carton = @Carton) <span class="hljs-keyword">BEGIN</span>
		<span class="hljs-keyword">INSERT</span> <span class="hljs-keyword">INTO</span> CartonFee <span class="hljs-keyword">VALUES</span> (@Carton, @<span class="hljs-keyword">Cost</span>)
	<span class="hljs-keyword">END</span> <span class="hljs-keyword">ELSE</span> <span class="hljs-keyword">BEGIN</span>
		<span class="hljs-keyword">UPDATE</span> CartonFee <span class="hljs-keyword">SET</span> <span class="hljs-keyword">Cost</span> = @<span class="hljs-keyword">Cost</span> <span class="hljs-keyword">WHERE</span> Carton = @Carton
	<span class="hljs-keyword">END</span>
<span class="hljs-keyword">END</span>
</div></code></pre>
<p>Just stare at that chain of casts for a moment. It teeters on the verge of making sense, calls to <code>LEFT</code> and <code>RIGHT</code> and multiplying by 100- we&#39;re just doing string munging to round off, that must be what&#39;s going on. If I count the parentheses, and really sit down and sketch this out, I can figure out what&#39;s going on, it must make sense, right?</p>
<p>And then you spot the <code>/140</code>. Divide by 140. Why? <em>Why that very specific number?</em> Is it a secret code? Is it a signal to the Illuminated Seers of Bavaria such that they know the stars are right and they may leave Aghartha to sit upon the Throne of the World? After all, <code>1 + 4 + 0</code> is five, and as we know, <a href="https://discordia.fandom.com/wiki/Law_of_Fives">the law of fives</a> is never wrong.</p>
<p>As it turns out, this stored procedure wasn&#39;t the problem. While it <em>looks</em> like it&#39;s responsible for updating the cost field, it&#39;s never actually called anywhere. It was, at one point, but it caused so much confusion that the users just started updating the table by hand. Somebody thought they&#39;d get clever and use an <code>UPDATE</code> statement and messed up.</p>
<!-- Easy reader Version: HAIL ERIS. FNORD -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/buildmaster-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/BuildMaster?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Confidence&amp;utm_campaign=Buildmaster_Footer">Utilize BuildMaster</a> to release your software with confidence, at the pace your business demands. <a href="https://inedo.com/BuildMaster/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Confidence&amp;utm_campaign=Buildmaster_Footer">Download</a> today!  
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=ih42J5lL8P0:aARZp3c5rfI:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/ih42J5lL8P0" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"16";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/comments/cast-away";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:28:"CodeSOD: I See What Happened";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://thedailywtf.com/articles/i-see-what-happened";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 14 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:52:"https://thedailywtf.com/articles/i-see-what-happened";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2922:"<p><strong>Graham</strong> picked up a ticket regarding their password system. It seemed that several users had tried to put in a perfectly valid password, according to the rules, but it was rejected.</p>
<p>Graham&#39;s first step was to attempt to replicate on his own, but couldn&#39;t do it. So he followed up with one of the end users, and got them to reveal the password they had <em>tried</em> to use. That allowed him to trigger the bug, so he dug into the debugger to find the root cause.</p>
<pre><code class="language-java"><div><span class="hljs-keyword">private</span> <span class="hljs-keyword">static</span> <span class="hljs-keyword">final</span> String UPPERCASE_LETTERS = <span class="hljs-string">&#34;ABDEFGHIJKLMNOPQRSTUVWXYZ&#34;</span>;

<span class="hljs-function"><span class="hljs-keyword">private</span> <span class="hljs-keyword">int</span> <span class="hljs-title">countMatches</span><span class="hljs-params">(String string, String charList)</span> </span>{
  <span class="hljs-keyword">int</span> count = <span class="hljs-number">0</span>;
  <span class="hljs-keyword">for</span> (<span class="hljs-keyword">char</span> c : charList.toCharArray()) {
    count += StringUtils.countMatches(string, String.valueOf(c));
  }
  <span class="hljs-keyword">return</span> count;
}
</div></code></pre>
<p>This isn&#39;t a great solution, but it at least <em>works</em>. Well, it &#34;works&#34; if you are able to remember how to recite the alphabet. If you look closely, you can tell that there are no pirate on their development team, because while pirates are fond of the letter &#34;R&#34;, their first love will always be the &#34;C&#34;.</p>
<!-- Easy Reader Version: The RWTF is pretty much every password complexity rule, like, there HAS to be a better way to do this (and there are many options) -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script><div>
	<img src="https://thedailywtf.com/images/footer/raygun50.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Forget logs. Next time you&#39;re struggling to replicate error, crash and performance issues in your apps - Think <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Raygun</a>! Installs in minutes. <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Learn more.</a>
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=XOWx-B-66l4:bUprqCXxaoU:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/XOWx-B-66l4" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"22";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:61:"https://thedailywtf.com/articles/comments/i-see-what-happened";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Mark Bowytz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"Error&#039;d: The WTF Experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/the-wtf-experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"Error'd";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Fri, 11 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/the-wtf-experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2730:"<p>&#34;As it turns out, they&#39;ve actually been singing <i>Purple Haze</i> before the start of all of those sportsball games,&#34; <strong>Adam</strong> writes.
</p><blockquote><p><a href="#Pic-2"><img itemprop="image" border="0" alt="" src="//thedailywtf.com/images/19/q4/e384/Pic-2.png"/></a></p><p> </p></blockquote>

<p><strong>Andrew C.</strong> writes, &#34;When you buy from &#39;Best Pool Supplies&#39;, make no mistake...you&#39;re going to pay for that level of quality.&#34;
</p><blockquote><p><a href="#Pic-1"><img border="0" alt="" src="//thedailywtf.com/images/19/q4/e384/Pic-1.png"/></a></p><p> </p></blockquote>

<p><strong>Jared</strong> wrote, &#34;Pulling invalid data is forgiveable, but using a loop is not.&#34;
</p><blockquote><p><a href="#Pic-3"><img border="0" alt="" src="//thedailywtf.com/images/19/q4/e384/Pic-3.jpg"/></a></p><p> </p></blockquote>

<p>&#34;VMware ESXi seems a little confused about how power state transitions work,&#34; writes <strong>Paul N.</strong>
</p><blockquote><p><a href="#Pic-4"><img border="0" alt="" src="//thedailywtf.com/images/19/q4/e384/Pic-4.png"/></a></p><p> </p></blockquote>

<p>&#34;At first I was annoyed I didn&#39;t get the job, but now I really want to go in for free and fix their systems for them!&#34; <strong>Mark</strong> wrote.
</p><blockquote><p><a href="#Pic-5"><img border="0" alt="" src="//thedailywtf.com/images/19/q4/e384/Pic-5.png"/></a></p><p> </p></blockquote>

<p><strong>Peter M.</strong> writes, &#34;Oh yes, Verizon! I am <u>very</u> excited! ...I&#39;m just having a difficult time defining why.&#34;
</p><blockquote><p><a href="#Pic-6"><img border="0" alt="" src="//thedailywtf.com/images/19/q4/e384/Pic-6.png"/></a></p><p> </p></blockquote>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">ProGet</a> supports your applications, Docker containers, and third-party packages, allowing you to enforce quality standards across all components. <a href="https://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">Download</a> and see how!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=bNGUth_7hbo:ueL41tHJR90:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/bNGUth_7hbo" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"17";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:60:"https://thedailywtf.com/articles/comments/the-wtf-experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"CodeSOD: Parse, Parse Again";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"https://thedailywtf.com/articles/parse-parse-again";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 10 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:50:"https://thedailywtf.com/articles/parse-parse-again";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3602:"<p>Sometimes, a block of terrible code exists for a good reason. Usually, it exists because someone was lazy or incompetent, which while not a <em>good</em> reason, at least makes sense. Sometimes, it exists for a <em>stupid</em> reason.</p>

<p><strong>Janet</strong>’s company recently bought another company, and now the new company had to be integrated into their IT operations. One of the little, tiny, minuscule known-issues in the new company’s system was that their logging was mis-configured. Instead of putting a new-line after each logging message, it put only a single space.</p>

<p>That tiny problem was a little bit larger, as each log message was a JSON object. The whole point of logging out a single JSON document per line was that it would be easy to parse/understand the log messages, but since they were all on a single line, it was impossible to just do that.</p>

<p>The developers at the acquired company were left with a choice: they could fix the glitch in the logging system so that it output a newline after each message, or they could just live with this. For some reason, they decided to live with it, and they came up with <em>this</em> solution for parsing the log files:</p>
<pre><code class="python">def parse(string):
  obs = []
  j = &#34;&#34;
  for c in string.split():
    j += c
    try:
      obs.append(json.loads(j))
      j = &#34;&#34;
    except ValueError:
      pass
 
  return obs</code></pre>

<p>This splits the string on spaces. Then, for each substring, it tries to parse it as a JSON object. If it succeeds, great. If it throws an exception, append the <em>next</em> substring to this one, and then try parsing again. Repeat until we’ve built a valid JSON document, than clear out the accumulator and repeat the process for all the rest of the messages. Eventually, return all the log messages parsed as JSON.</p>

<p>As a fun side effect, <code>.split</code> is going to throw the spaces away, so when they <code>j += c</code>, if your log message looked like:</p>
<pre><code class="json">{&#34;type&#34;: &#34;Error&#34;, &#34;message&#34;: &#34;Unable to parse JSON document&#34;}</code></pre>

<p>After parsing that into JSON, the message becomes <code>UnabletoparseJSONdocument</code>.</p>

<p>But at least they didn’t have to solve than newline bug.</p>
<!-- Easy Reader Version: if this is an easy reader version, return it, otherwise append this to the easy reader version and then if it's an easy reader version return it otherwise… -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/footer/raygun50.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Forget logs. Next time you&#39;re struggling to replicate error, crash and performance issues in your apps - Think <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Raygun</a>! Installs in minutes. <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Learn more.</a>
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=k31U-tW9yyY:r8bHthyjO6A:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/k31U-tW9yyY" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"24";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:59:"https://thedailywtf.com/articles/comments/parse-parse-again";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:41:"Coded Smorgasbord: Driven to Substraction";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://thedailywtf.com/articles/driven-to-substraction";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:17:"Coded Smorgasbord";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 09 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:55:"https://thedailywtf.com/articles/driven-to-substraction";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:70018:"<p><strong>Deon</strong> (<a href="https://thedailywtf.com/articles/unstrung-manager">previously</a>) has some good news. His contract at Initrode is over, and he’s on his way out the door. But before he goes, he wants to share more of his pain with us.</p>

<p>You may remember that the <code>StringManager</code> class had a bunch of data type conversions to numbers and dates. Well guess what, there’s also a <code>DateManager</code> class, which is another 1600 lines of methods to handle dates.</p>

<p>As you might expect, there are a pile of re-invented conversion and parsing methods which do the same thing as the built-in methods. But there’s also utility methods to help us handle date-related operations.</p>
<pre><code class="csharp">		public static int subStractFromCurrentDate(System.DateTime dateTimeParm) 
		{
			//get now
			System.DateTime now = System.DateTime.Now;
			//now compare days
			int daysDifference  = now.Day - dateTimeParm.Day;
			return daysDifference ;
		}</code></pre>

<p>Fun fact: the <code>Day</code> property returns the day of the month. So this method might “subStract”, but if these two dates fall in different months, we’re going to get unexpected results. </p>

<p>One of the smaller string formatters included is this one:</p>
<pre><code class="csharp">		public static string formatEnglishDate (System.DateTime inputDateTime) 
		{
			Hashtable _monthsInEnglishByMonthNumber = new Hashtable();
			_monthsInEnglishByMonthNumber[1] = &#34;January&#34;;
			_monthsInEnglishByMonthNumber[2] = &#34;February&#34;;
			_monthsInEnglishByMonthNumber[3] = &#34;March&#34;;
			_monthsInEnglishByMonthNumber[4] = &#34;April&#34;;
			_monthsInEnglishByMonthNumber[5] = &#34;May&#34;;
			_monthsInEnglishByMonthNumber[6] = &#34;June&#34;;
			_monthsInEnglishByMonthNumber[7] = &#34;July&#34;;
			_monthsInEnglishByMonthNumber[8] = &#34;August&#34;;
			_monthsInEnglishByMonthNumber[9] = &#34;September&#34;;
			_monthsInEnglishByMonthNumber[10] = &#34;October&#34;;
			_monthsInEnglishByMonthNumber[11] = &#34;November&#34;;
			_monthsInEnglishByMonthNumber[12] = &#34;December&#34;;

			StringBuilder _dateBldr = new StringBuilder();
			_dateBldr.Append(_monthsInEnglishByMonthNumber[inputDateTime.Month].ToString());
			_dateBldr.Append(&#34; &#34;);
			_dateBldr.Append(inputDateTime.Day.ToString());
			_dateBldr.Append(&#34;, &#34;);
			_dateBldr.Append(inputDateTime.Year.ToString());

			return _dateBldr.ToString();
		}</code></pre>

<p>Among all the bad things implied here, I really like that they used a <code>Hashtable</code> as an array.</p>
<pre><code class="csharp">        public static bool  currentDateIsFirstBusinessDateOfTheMonth 
                            (
                                Hashtable inputHolidayHash
                            )
        {
            /*
             * If current date is not a business date, then it cannot
             * be the first business date of the month.
             */
            DateTime _currentDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            _currentDate =
                new DateTime(2010, 5, 6);
            if (
                    _currentDate.DayOfWeek == DayOfWeek.Saturday
                    ||
                    _currentDate.DayOfWeek == DayOfWeek.Sunday
                    ||
                    inputHolidayHash[_currentDate] != null
                )
                return false;

            /*
             * If current date is a business date, and if it is also
             * the first calendar date of the month, then the
             * current date is the first business date of the month.
             */

            DateTime _firstDayOfTheMonth =
                _currentDate.AddDays(1 - _currentDate.Day);
            if (_firstDayOfTheMonth == _currentDate)
                return true;

            /*
             * If current date is a business date, but is not the 1st calendar
             * date of the month, and, if, in stepping back day by day 
             * from the current date,  we encounter a business day before 
             * encountering the last calendar day of the preceding month, then the 
             * current date is NOT the first business date of the month.
            */
            DateTime _tempDate = _currentDate.AddDays(-1);
            while (_tempDate &gt;= _firstDayOfTheMonth)
            {
                if (
                        _tempDate.DayOfWeek != DayOfWeek.Saturday
                        &amp;&amp;
                        _tempDate.DayOfWeek != DayOfWeek.Sunday
                        &amp;&amp;
                        inputHolidayHash[_tempDate] == null
                    )
                    return false;
                _tempDate = _tempDate.AddDays(-1);
            }
            /*
             * * If current date is a business date, but is not the 1st calendar
             * date,and, if, in stepping back day by day from the current date, 
             * we encounter no business day before encountering the 
             * 1st calendar day of the month, then the current date 
             * IS the first business date of the month.
            */
            return true;
        }</code></pre>

<p>This one has loads of comments, and honestly, I still have no idea what it’s doing. If it’s checking the <em>current</em> day, why does it need to cycle through other days? Why even ask that question, because clearly while debugging they hard-coded a testing date (<code>new DateTime(2010, 5, 6)</code>) and just left that in there.</p>

<p>I’m not the only one getting confused. Check out this comment:</p>
<pre><code class="csharp">
        //@??
        public static DateTime givenPeriodEndDateFindLastBusinessDateInPeriod
                                (
                                    DateTime inputPeriodEndDate
                                    , Hashtable inputHolidayHash
                                )
        {
          ...
        }</code></pre>

<p>And if you’re missing good old <code>StringManager</code>, don’t worry, we use it here:</p>
<pre><code class="csharp">    /**
		 * @description format date
		 * */
		public static string formatYYYYMMDD (System.DateTime inputDateTime) 
		{
			StringBuilder _bldr = new StringBuilder();
			_bldr.Append(inputDateTime.Year.ToString());
			_bldr.Append(initrode.utilities.StringManager.Fill(inputDateTime.Month.ToString(),
															&#34;0&#34;,       // Zero-Fill
															true,	   // Fill from left
															2));        // String length

			_bldr.Append(initrode.utilities.StringManager.Fill(inputDateTime.Day.ToString(),
															&#34;0&#34;,       // Zero-Fill
															true,	   // Fill from left
															2));       // String length
			return _bldr.ToString();
		}</code></pre>

<p>And all of this is from just about the first third of the code. I’m trying to keep to shorter methods before posting the whole blob of ugly. So with that in mind, what if you wanted to compare dates?</p>
<pre><code class="csharp">		public static DateComparison date1ComparedToDate2(DateTime inputDate1, 
															DateTime inputDate2)
		{
			if (inputDate1.Year &gt; inputDate2.Year) return DateComparison.gt;
			if (inputDate1.Year &lt; inputDate2.Year) return DateComparison.lt;
			if (inputDate1.DayOfYear &gt; inputDate2.DayOfYear) return DateComparison.gt;
			if (inputDate1.DayOfYear &lt; inputDate2.DayOfYear) return DateComparison.lt;
			return DateComparison.eq;
		
		}</code></pre>

<p>Oh yeah, not only do we break the dates up into parts to compare them, we <em>also</em> have a custom enumerated type to represent the result of the comparison. And it’s not just dates, we do it with times, too.</p>
<pre><code class="csharp">		public static DateComparison timestamp1ComparedToTimestamp2(DateTime inputTimestamp1, 
																	DateTime inputTimestamp2)
		{
			if (inputTimestamp1.Year &gt; inputTimestamp2.Year) return DateComparison.gt;
			if (inputTimestamp1.Year &lt; inputTimestamp2.Year) return DateComparison.lt;
			if (inputTimestamp1.DayOfYear &gt; inputTimestamp2.DayOfYear) return DateComparison.gt;
			if (inputTimestamp1.DayOfYear &lt; inputTimestamp2.DayOfYear) return DateComparison.lt;
			if (inputTimestamp1.Hour &gt; inputTimestamp2.Hour) return DateComparison.gt;
			if (inputTimestamp1.Hour &lt; inputTimestamp2.Hour) return DateComparison.lt;
			if (inputTimestamp1.Minute &gt; inputTimestamp2.Minute) return DateComparison.gt;
			if (inputTimestamp1.Minute &lt; inputTimestamp2.Minute) return DateComparison.lt;
			if (inputTimestamp1.Second &gt; inputTimestamp2.Second) return DateComparison.gt;
			if (inputTimestamp1.Second &lt; inputTimestamp2.Second) return DateComparison.lt;
			if (inputTimestamp1.Millisecond &gt; inputTimestamp2.Millisecond) return DateComparison.gt;
			if (inputTimestamp1.Millisecond &lt; inputTimestamp2.Millisecond) return DateComparison.lt;
			return DateComparison.eq;
		
		}</code></pre>

<p>Initrode has a bright future with this product. Deon adds:</p>

<blockquote>
<p>The contractor who is replacing me has rolled his own piece of software to try and replace Entity Framework because his version is “better” despite being written around a decade ago, so I’m sure he’ll fit right in.</p>
</blockquote>

<p>The future’s so bright I’ve gotta wear shades.</p>

<p>Here’s the full block, if you want to suffer through that:</p>
<pre><code class="csharp">/*
  Changes Log:

  @01 - 01/23/2009 - {some initials were here} - Improve performance of approval screens.
*/
using System;
using System.Collections;
using System.Globalization; 
using System.Text;

namespace initrode.utilities
{
	/// &lt;summary&gt;
	/// Summary description for DateManager.
	/// &lt;/summary&gt;
	public class DateManager
	{
		public enum	DateComparison {gt = 1, eq = 0, lt = -1}
        public enum DateTimeParts
        {
            dateOnly
            , dateAndTime
            , dateTimeAndAMOrPM
        }
						
		/*
			* @description return the days difference from today date
			* @parm int amount of days in the past
			* @return int the amount of days difference
			* 
			**/
		public static int subStractFromCurrentDate(System.DateTime dateTimeParm) 
		{
			//get now
			System.DateTime now = System.DateTime.Now;
			//now compare days
			int daysDifference  = now.Day - dateTimeParm.Day;
			return daysDifference ;
		}
		/**
		 * @description format date
		 * */
		public static string format (System.DateTime dateTime, string format) 
		{
			string dateFormat;
			dateFormat = dateTime.ToString(format,DateTimeFormatInfo.InvariantInfo);
			return dateFormat;
		}
        public static DateTime  convertDateStringInSlashedFormatToDateTime
                                (
                                    string inputDateStringInSlashedFormat
                                )
        {
            inputDateStringInSlashedFormat =
                initrode.utilities.StringManager.StripWhitespace
                (
                    inputDateStringInSlashedFormat
                );
            ArrayList _dateParts =
                initrode.utilities.StringManager.splitIntoArrayList
                (
                    inputDateStringInSlashedFormat
                    ,@&#34;/&#34;
                );
            if (_dateParts.Count != 3) return new DateTime(1900, 1, 1);

            string _monthString =
                initrode.utilities.StringManager.StripWhitespace
                (
                    _dateParts[0].ToString()
                );
            if (
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        _monthString
                    ) == false
                )
                new DateTime(1900, 1, 1);

            string _dayString =
                initrode.utilities.StringManager.StripWhitespace
                (
                    _dateParts[1].ToString()
                );
            if (
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        _dayString
                    ) == false
                )
                new DateTime(1900, 1, 1);

            string _yearString =
                initrode.utilities.StringManager.StripWhitespace
                (
                    _dateParts[2].ToString()
                );
            if (
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        _yearString
                    ) == false
                )
                new DateTime(1900, 1, 1);
            return new DateTime
                        (
                            Convert.ToInt32
                            (
                                _yearString
                            )
                            , Convert.ToInt32
                            (
                                _monthString
                            )
                            , Convert.ToInt32
                            (
                                _dayString
                            )
                        );
        }            
		/**
		 * @description format date
		 * */
		public static string formatEnglishDate (System.DateTime inputDateTime) 
		{
			Hashtable _monthsInEnglishByMonthNumber = new Hashtable();
			_monthsInEnglishByMonthNumber[1] = &#34;January&#34;;
			_monthsInEnglishByMonthNumber[2] = &#34;February&#34;;
			_monthsInEnglishByMonthNumber[3] = &#34;March&#34;;
			_monthsInEnglishByMonthNumber[4] = &#34;April&#34;;
			_monthsInEnglishByMonthNumber[5] = &#34;May&#34;;
			_monthsInEnglishByMonthNumber[6] = &#34;June&#34;;
			_monthsInEnglishByMonthNumber[7] = &#34;July&#34;;
			_monthsInEnglishByMonthNumber[8] = &#34;August&#34;;
			_monthsInEnglishByMonthNumber[9] = &#34;September&#34;;
			_monthsInEnglishByMonthNumber[10] = &#34;October&#34;;
			_monthsInEnglishByMonthNumber[11] = &#34;November&#34;;
			_monthsInEnglishByMonthNumber[12] = &#34;December&#34;;

			StringBuilder _dateBldr = new StringBuilder();
			_dateBldr.Append(_monthsInEnglishByMonthNumber[inputDateTime.Month].ToString());
			_dateBldr.Append(&#34; &#34;);
			_dateBldr.Append(inputDateTime.Day.ToString());
			_dateBldr.Append(&#34;, &#34;);
			_dateBldr.Append(inputDateTime.Year.ToString());

			return _dateBldr.ToString();
		}
        public static bool currentDateIsFirstSaturdayOfTheMonth()
        {
            /*
             * If current date is not a business date, then it cannot
             * be the first business date of the month.
             */
            DateTime _currentDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            if (
                    _currentDate.DayOfWeek == DayOfWeek.Saturday
                    &amp;&amp;
                    _currentDate.Day &lt;= 7
                )
                return true;

            return false;
        }

        public static bool  currentDateIsFirstBusinessDateOfTheMonth 
                            (
                                Hashtable inputHolidayHash
                            )
        {
            /*
             * If current date is not a business date, then it cannot
             * be the first business date of the month.
             */
            DateTime _currentDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            _currentDate =
                new DateTime(2010, 5, 6);
            if (
                    _currentDate.DayOfWeek == DayOfWeek.Saturday
                    ||
                    _currentDate.DayOfWeek == DayOfWeek.Sunday
                    ||
                    inputHolidayHash[_currentDate] != null
                )
                return false;

            /*
             * If current date is a business date, and if it is also
             * the first calendar date of the month, then the
             * current date is the first business date of the month.
             */

            DateTime _firstDayOfTheMonth =
                _currentDate.AddDays(1 - _currentDate.Day);
            if (_firstDayOfTheMonth == _currentDate)
                return true;

            /*
             * If current date is a business date, but is not the 1st calendar
             * date of the month, and, if, in stepping back day by day 
             * from the current date,  we encounter a business day before 
             * encountering the last calendar day of the preceding month, then the 
             * current date is NOT the first business date of the month.
            */
            DateTime _tempDate = _currentDate.AddDays(-1);
            while (_tempDate &gt;= _firstDayOfTheMonth)
            {
                if (
                        _tempDate.DayOfWeek != DayOfWeek.Saturday
                        &amp;&amp;
                        _tempDate.DayOfWeek != DayOfWeek.Sunday
                        &amp;&amp;
                        inputHolidayHash[_tempDate] == null
                    )
                    return false;
                _tempDate = _tempDate.AddDays(-1);
            }
            /*
             * * If current date is a business date, but is not the 1st calendar
             * date,and, if, in stepping back day by day from the current date, 
             * we encounter no business day before encountering the 
             * 1st calendar day of the month, then the current date 
             * IS the first business date of the month.
            */
            return true;
        }
        //@??
        public static DateTime givenPeriodEndDateFindLastBusinessDateInPeriod
                                (
                                    DateTime inputPeriodEndDate
                                    , Hashtable inputHolidayHash
                                )
        {
            if (inputHolidayHash[inputPeriodEndDate] == null)
                return inputPeriodEndDate;
            DateTime _tempDate = inputPeriodEndDate.AddDays(-1);

            while (
                        (
                            _tempDate.DayOfWeek == DayOfWeek.Saturday
                            ||
                            _tempDate.DayOfWeek == DayOfWeek.Sunday
                        )
                        ||
                        inputHolidayHash[_tempDate] != null
                    )
            {
                _tempDate = _tempDate.AddDays(-1);
            }
            return _tempDate;
        }

		/**
		 * @description format date
		 * */
        public static string convertDateTimeToSQLDate
                                (
                                    DateTime inputDateTime
                                )
        {
            StringBuilder _sqlDateBldr =
                new StringBuilder();
            _sqlDateBldr.AppendFormat
            (
                &#34;{0}/{1}/{2}&#34;
                ,inputDateTime.Month.ToString()
                ,inputDateTime.Day.ToString()
                ,inputDateTime.Year.ToString()
            );
            return _sqlDateBldr.ToString();
        }
        /**
         * @description format date
         * */
        public static string convertDateTimeToDB2Timestamp
                                (
                                    DateTime inputDateTime
                                )
        {
            StringBuilder _sqlDateBldr =
                new StringBuilder();
            _sqlDateBldr.AppendFormat
            (
                &#34;{0}-{1}-{2}.{3}:{4}:{5}.{6}&#34;
                , inputDateTime.Year.ToString()
                ,   initrode.utilities.StringManager.Fill
                    (
                        inputDateTime.Month.ToString()
                        ,&#34;0&#34;
                        ,true  //boolFromLeft
                        ,2
                    )
                ,   initrode.utilities.StringManager.Fill
                    (
                        inputDateTime.Day.ToString()
                        ,&#34;0&#34;
                        ,true  //boolFromLeft
                        ,2
                    )
                , initrode.utilities.StringManager.Fill
                    (
                        inputDateTime.Hour.ToString()
                        ,&#34;0&#34;
                        ,true  //boolFromLeft
                        ,2
                    )
                , initrode.utilities.StringManager.Fill
                    (
                        inputDateTime.Minute.ToString()
                        ,&#34;0&#34;
                        ,true  //boolFromLeft
                        ,2
                    )
                ,   initrode.utilities.StringManager.Fill
                    (
                        inputDateTime.Second.ToString()
                        , &#34;0&#34;
                        , true  //boolFromLeft
                        , 2
                    )
                ,   initrode.utilities.StringManager.Fill
                    (
                        inputDateTime.Millisecond.ToString()
                        , &#34;0&#34;
                        , true  //boolFromLeft
                        , 2
                    )
            );
            return _sqlDateBldr.ToString();
        }

		/**
		 * @description format date
		 * */
		public static string formatYYYYMMDD (System.DateTime inputDateTime) 
		{
			StringBuilder _bldr = new StringBuilder();
			_bldr.Append(inputDateTime.Year.ToString());
			_bldr.Append(initrode.utilities.StringManager.Fill(inputDateTime.Month.ToString(),
															&#34;0&#34;,       // Zero-Fill
															true,	   // Fill from left
															2));        // String length

			_bldr.Append(initrode.utilities.StringManager.Fill(inputDateTime.Day.ToString(),
															&#34;0&#34;,       // Zero-Fill
															true,	   // Fill from left
															2));       // String length
			return _bldr.ToString();
		}
		//@01
		public static DateTime givenDateGetPeriodStartDate(DateTime inputDate1)
		{
			if (inputDate1.Day &gt; 15) return new DateTime(inputDate1.Year,inputDate1.Month,16);
			return new DateTime(inputDate1.Year,inputDate1.Month,1);
		}
		//@01
		public static DateTime givenDateGetPeriodEndDate(DateTime inputDate1)
		{
			if (inputDate1.Day &lt; 16) return new DateTime(inputDate1.Year,inputDate1.Month,15);
			inputDate1 = inputDate1.AddMonths(1);
			inputDate1 = new DateTime(inputDate1.Year,inputDate1.Month,1).AddDays(-1);
			return inputDate1;
		}

		/**
		 * @description add days to a date
		 * */
		public static DateTime addDays (DateTime dateTime, int days) 
		{
			DateTime newDate = dateTime.AddDays(days);
			return newDate;
		}
		/** 
		 * @description get first day of the  month from mm-dd-yyyy formatted string
		 * **/
		public static DateTime getFirstDayofTheMonthFromMM_DD_YYYYFormattedString(
									string inputDateTimeInMM_DD_YYYYFormatString) 
		{
			if (initrode.utilities.StringManager.IsValidDateInMM_DD_YYYYFormat(inputDateTimeInMM_DD_YYYYFormatString) == false)
			{
				return initrode.utilities.DateManager.getFirstDayofTheCurrentMonth();
			}
			return initrode.utilities.DateManager.getFirstDayofTheMonth(Convert.ToDateTime(inputDateTimeInMM_DD_YYYYFormatString));
		}


		/** 
		 * @description get first day of the  month
		 * **/
		public static DateTime getFirstDayofTheMonth(System.DateTime inputDateTime) 
		{
			return new DateTime(inputDateTime.Year,
								inputDateTime.Month,
								1);
		}

        public static DateTime  convertTimestampOrDateInAnyStringFormatToDateTime
                                (
                                    string inputTimestampOrDateInAnyStringFormat
                                )
        {
            DateTime _returnDateTime = 
                new DateTime(1900, 1, 1);
            ArrayList _splitDateTimeParts = new ArrayList();
            inputTimestampOrDateInAnyStringFormat =
                initrode.utilities.StringManager.StripWhitespaceFromEnds
                (
                    inputTimestampOrDateInAnyStringFormat
                );
            DateTimeParts _myDateTimeParts = DateTimeParts.dateOnly;
            string _timeParts = &#34;&#34;;
            string _amOrPMParts = &#34;&#34;;
            if (inputTimestampOrDateInAnyStringFormat.Contains(&#34; &#34;))
            {
                _splitDateTimeParts =
                    initrode.utilities.StringManager.splitIntoArrayList
                    (
                        inputTimestampOrDateInAnyStringFormat
                        , &#34; &#34;
                    );
            }
            else
            {
                _splitDateTimeParts.Add
                (
                    inputTimestampOrDateInAnyStringFormat
                );
            }
            DateTime _dateOnly = new DateTime(1900, 1, 1);
            switch (_splitDateTimeParts.Count)
            {
                case 1:
                    _myDateTimeParts = DateTimeParts.dateOnly;
                    _dateOnly =
                        initrode.utilities.DateManager.convertDateInAnyStringFormatIntoDateTime
                        (
                            inputTimestampOrDateInAnyStringFormat
                        );
                    break;
                case 2:
                    _myDateTimeParts = DateTimeParts.dateAndTime;
                    _dateOnly =
                        initrode.utilities.DateManager.convertDateInAnyStringFormatIntoDateTime
                        (
                            _splitDateTimeParts[0].ToString()
                        );
                    _timeParts =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _splitDateTimeParts[1].ToString()
                        );
                    break;
                case 3:
                    _myDateTimeParts = DateTimeParts.dateTimeAndAMOrPM;
                    _dateOnly =
                        initrode.utilities.DateManager.convertDateInAnyStringFormatIntoDateTime
                        (
                            _splitDateTimeParts[0].ToString()
                        );
                    _timeParts =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _splitDateTimeParts[1].ToString()
                        );
                    _amOrPMParts =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _splitDateTimeParts[2].ToString()
                        ).ToUpper();

                    break;
                default:
                    return _returnDateTime;
            }
            if (_myDateTimeParts == DateTimeParts.dateOnly) return _dateOnly;
            if (_dateOnly == new DateTime(1900, 1, 1)) return _returnDateTime;

            if (
                    _myDateTimeParts == DateTimeParts.dateTimeAndAMOrPM
                    &amp;&amp;
                    _amOrPMParts.CompareTo(&#34;AM&#34;) != 0
                    &amp;&amp;
                    _amOrPMParts.CompareTo(&#34;PM&#34;) != 0
                ) return _returnDateTime;
                
            switch (_myDateTimeParts)
            {
                case DateTimeParts.dateAndTime:
                return  initrode.utilities.DateManager.convertTimeInStringFormatAlongWithDateOnlyDateTimeIntoDateTime
                        (
                            _timeParts //string inputStrTime
                            , false //bool inputAMOrPMFormat
                            , &#34;&#34; //string inputAMOrPM
                            , _dateOnly //DateTime inputDateOnlyDateTime
                        );
                case DateTimeParts.dateTimeAndAMOrPM:
                return initrode.utilities.DateManager.convertTimeInStringFormatAlongWithDateOnlyDateTimeIntoDateTime
                        (
                            _timeParts //string inputStrTime
                            , true //bool inputAMOrPMFormat
                            , _amOrPMParts //string inputAMOrPM
                            , _dateOnly //DateTime inputDateOnlyDateTime
                        );
            }
            return _returnDateTime;
        }
        public static DateTime convertTimeInStringFormatAlongWithDateOnlyDateTimeIntoDateTime
                                (
                                    string inputStrTime
                                    ,bool inputAMOrPMFormat
                                    ,string inputAMOrPM
                                    ,DateTime inputDateOnlyDateTime
                                )
        {
            DateTime _returnDateTime = inputDateOnlyDateTime;
            if (inputStrTime.Contains(&#34;:&#34;) == false) return _returnDateTime;

            int _intMillisecondsPart = 0;
            if (inputStrTime.Contains(&#34;.&#34;) == true)
            {
                ArrayList _millisecondsAndTimeParts =
                    initrode.utilities.StringManager.splitIntoArrayList
                    (
                        inputStrTime
                        ,@&#34;.&#34;
                    );
                if (_millisecondsAndTimeParts.Count != 2) return _returnDateTime;
                string _strMillisecondsPart =
                    initrode.utilities.StringManager.StripWhitespace
                    (
                        _millisecondsAndTimeParts[1].ToString()
                    );
                if (initrode.utilities.StringManager.IsValidNumber(_strMillisecondsPart) == true)
                    _intMillisecondsPart =
                        Convert.ToInt32
                        (
                            _strMillisecondsPart
                        );
                inputStrTime =
                    initrode.utilities.StringManager.StripWhitespace
                    (
                        _millisecondsAndTimeParts[0].ToString()
                    );
            }
            ArrayList _timeParts =
                initrode.utilities.StringManager.splitIntoArrayList
                (
                    inputStrTime
                    ,&#34;:&#34;
                );
            if (_timeParts.Count != 3) return _returnDateTime;


            string _strHoursPart =
                initrode.utilities.StringManager.StripWhitespace
                (
                    _timeParts[0].ToString()
                );
            string _strMinutesPart =
                initrode.utilities.StringManager.StripWhitespace
                (
                    _timeParts[1].ToString()
                );
            string _strSecondsPart =
                initrode.utilities.StringManager.StripWhitespace
                (
                    _timeParts[2].ToString()
                );
            if (
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        _strHoursPart
                    ) == false
                    ||
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        _strMinutesPart
                    ) == false
                    ||
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        _strSecondsPart
                    ) == false
                ) return _returnDateTime;

            int _intHoursPart =
                Convert.ToInt32
                (
                    _strHoursPart
                );
            int _intMinutesPart =
                Convert.ToInt32
                (
                    _strMinutesPart
                );
            int _intSecondsPart =
                Convert.ToInt32
                (
                    _strSecondsPart
                );

            if (_intHoursPart &gt; 23) return _returnDateTime;
            if (inputAMOrPMFormat == true)
            {
                if (_intHoursPart &gt; 12) return _returnDateTime;
            }
            if (_intMinutesPart &gt; 59) return _returnDateTime;
            if (_intSecondsPart &gt; 59) return _returnDateTime;

            if (inputAMOrPMFormat == true)
            {
                if (inputAMOrPM.CompareTo(&#34;PM&#34;) == 0)
                {
                    _intHoursPart += 12;
                }
                else if (
                            inputAMOrPM.CompareTo(&#34;AM&#34;) == 0
                            &amp;&amp;
                            _intHoursPart == 12
                            &amp;&amp;
                            _intMinutesPart == 0
                            &amp;&amp;
                            _intSecondsPart == 0
                            &amp;&amp;
                            _intMillisecondsPart == 0
                        )
                {
                    return new DateTime
                                (
                                    inputDateOnlyDateTime.Year
                                    , inputDateOnlyDateTime.Month
                                    , inputDateOnlyDateTime.Day
                                );
                }
            }
            _returnDateTime =
                new DateTime
                    (
                        inputDateOnlyDateTime.Year
                        , inputDateOnlyDateTime.Month
                        , inputDateOnlyDateTime.Day
                        , _intHoursPart
                        , _intMinutesPart
                        , _intSecondsPart
                        , _intMillisecondsPart
                    );
            return _returnDateTime;
        }
        public static DateTime convertDateInAnyStringFormatIntoDateTime
                                (
                                    string inputDateInAnyStringFormat   
                                )
        {
            DateTime _returnDateTime = new DateTime(1900, 1, 1);
            inputDateInAnyStringFormat =
                initrode.utilities.StringManager.StripWhitespace
                (
                    inputDateInAnyStringFormat
                );
            ArrayList _dateParts = new ArrayList();
            string _strMonth = &#34;&#34;;
            string _strDay = &#34;&#34;;
            string _strYear = &#34;&#34;;
            if (inputDateInAnyStringFormat.Contains(&#34;/&#34;) == true)
            {
                _dateParts =
                    initrode.utilities.StringManager.splitIntoArrayList
                    (
                        inputDateInAnyStringFormat
                        ,@&#34;/&#34;
                    );
                if (_dateParts.Count != 3) return _returnDateTime;
                _strMonth =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _dateParts[0].ToString()
                        );
                _strDay =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _dateParts[1].ToString()
                        );
                _strYear =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _dateParts[2].ToString()
                        );
                return initrode.utilities.DateManager.convertDateTimeStringPartsIntoDateTime
                        (
                            _strMonth
                            ,_strDay
                            ,_strYear
                        );
            }
            if (inputDateInAnyStringFormat.Contains(&#34;-&#34;) == true)
            {
                _dateParts =
                    initrode.utilities.StringManager.splitIntoArrayList
                    (
                        inputDateInAnyStringFormat
                        , @&#34;-&#34;
                    );
                if (_dateParts.Count != 3) return _returnDateTime;
                _strYear =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _dateParts[0].ToString()
                        );
                _strMonth =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _dateParts[1].ToString()
                        );
                _strDay =
                        initrode.utilities.StringManager.StripWhitespace
                        (
                            _dateParts[2].ToString()
                        );
                return initrode.utilities.DateManager.convertDateTimeStringPartsIntoDateTime
                        (
                            _strMonth
                            , _strDay
                            , _strYear
                        );
            }
            if (inputDateInAnyStringFormat.Length == 8)
            {
                _strYear =
                    inputDateInAnyStringFormat.Substring(0, 4);
                _strMonth =
                    inputDateInAnyStringFormat.Substring(4, 2);
                _strDay =
                    inputDateInAnyStringFormat.Substring(6, 2);
                return initrode.utilities.DateManager.convertDateTimeStringPartsIntoDateTime
                        (
                            _strMonth
                            , _strDay
                            , _strYear
                        );
            }
            if (inputDateInAnyStringFormat.Length == 6)
            {
                _strYear =
                    inputDateInAnyStringFormat.Substring(0, 2);
                _strMonth =
                    inputDateInAnyStringFormat.Substring(2, 2);
                _strDay =
                    inputDateInAnyStringFormat.Substring(4, 2);
                return initrode.utilities.DateManager.convertDateTimeStringPartsIntoDateTime
                        (
                            _strMonth
                            , _strDay
                            , _strYear
                        );
            }
            return _returnDateTime;
        }
        public static DateTime convertDateTimeStringPartsIntoDateTime
                                (
                                    string inputStrMonth
                                    , string inputStrDay
                                    , string inputStrYear
                                )
        {
            DateTime _returnDateTime = new DateTime(1900, 1, 1);
            if (
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        inputStrMonth
                    ) == false
                    ||
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        inputStrDay
                    ) == false
                    ||
                    initrode.utilities.StringManager.IsValidNumber
                    (
                        inputStrYear
                    ) == false
                ) return _returnDateTime;

            int _intYear =
                Convert.ToInt32
                (
                    inputStrYear
                );
            if (_intYear &lt;= 100)
            {
                if (_intYear &gt;= 90)
                {
                    _intYear += 1900;
                }
                else
                {
                    _intYear += 2000;
                }
            }
            inputStrYear = _intYear.ToString();

            inputStrMonth = 
                initrode.utilities.StringManager.Fill
                (
                    inputStrMonth
                    ,&#34;0&#34;
                    ,true //fromLeft
                    ,2
                );

            inputStrDay = 
                initrode.utilities.StringManager.Fill
                (
                    inputStrDay
                    ,&#34;0&#34;
                    ,true //fromLeft
                    ,2
                );

            if (
                    initrode.utilities.StringManager.IsValidDate
                    (
                        inputStrMonth
                        ,inputStrDay
                        ,inputStrYear
                    ) == false
                ) return _returnDateTime;

            _returnDateTime =
                new DateTime
                    (
                        Convert.ToInt32
                        (
                            inputStrYear
                        )
                        ,   Convert.ToInt32
                            (
                                inputStrMonth
                            )
                        , Convert.ToInt32
                            (
                                inputStrDay
                            )
                    );
            return _returnDateTime;
        }
        public static DateTime convertDateIn_MM_Slash_DD_Slash_YYYY_FormatToDateTime
                                (
                                    string inputDateIn_MM_Slash_DD_Slash_YYYY_Format
                                )
        {
            if (initrode.utilities.StringManager.IsValidDateInMM_DD_YYYYFormat(inputDateIn_MM_Slash_DD_Slash_YYYY_Format) == false)
                return Convert.ToDateTime(&#34;1/1/1900&#34;);
            ArrayList _dateParts =
                initrode.utilities.StringManager.splitIntoArrayList
                (
                    inputDateIn_MM_Slash_DD_Slash_YYYY_Format
                    ,&#34;/&#34;
                );
            string _mm = _dateParts[0].ToString();
            if (_mm.Substring(0, 1).CompareTo(&#34;0&#34;) == 0)
                _mm = _mm.Substring(1, 1);
            string _dd = _dateParts[1].ToString();
            if (_dd.Substring(0, 1).CompareTo(&#34;0&#34;) == 0)
                _dd = _dd.Substring(1, 1);
            string _yyyy = _dateParts[2].ToString();

            return new DateTime
                        (
                                Convert.ToInt32
                                (
                                    _yyyy
                                )
                            ,   Convert.ToInt32
                                (
                                    _mm
                                )
                            ,   Convert.ToInt32
                                (
                                    _dd
                                )
                        );
        }
        public static bool  isInputtedDateTheLastBusinessDateOfTheMonth
                            (
                                DateTime inputDateTime
                                , Hashtable inputHolidayHash
                            )
        {
            inputDateTime =
                new DateTime
                    (
                        inputDateTime.Year
                        , inputDateTime.Month
                        , inputDateTime.Day
                    );

            DateTime _lastBusinessDate =
                initrode.utilities.DateManager.getLastBusinessDateOfMonthForInputtedDate
                (
                    inputDateTime
                    ,inputHolidayHash
                );
            if (
                    inputDateTime.Year == _lastBusinessDate.Year
                    &amp;&amp; inputDateTime.Month == _lastBusinessDate.Month
                    &amp;&amp; inputDateTime.Day == _lastBusinessDate.Day
                )
                return true;
            return false;
        }

        public static DateTime  getLastBusinessDateOfMonthForInputtedDate
                                (
                                    DateTime inputDateTime
                                    , Hashtable inputHolidayHash
                                )
        {
            inputDateTime = 
                new DateTime
                    (
                        inputDateTime.Year
                        ,inputDateTime.Month
                        ,inputDateTime.Day
                    );
            DateTime _lastBusinessDate;
            if (
                    initrode.utilities.DateManager.isInputtedDateABusinessDate
                    (
                        inputDateTime
                        , inputHolidayHash
                    ) == true
                )
                _lastBusinessDate =
                    inputDateTime;
            else
                _lastBusinessDate =
                    initrode.utilities.DateManager.getNextBusinessDateFromInputtedDate
                    (
                        inputDateTime
                        , inputHolidayHash
                    );
            if (_lastBusinessDate.Month != inputDateTime.Month)
            {
                if (
                        initrode.utilities.DateManager.isInputtedDateABusinessDate
                        (
                            inputDateTime
                            , inputHolidayHash
                        ) == true
                    )
                    return inputDateTime;
                else
                    return
                        initrode.utilities.DateManager.getPreviousBusinessDateFromInputtedDate
                        (
                            inputDateTime
                            , inputHolidayHash
                        );
            } 
            DateTime _nextBusinessDate =
                initrode.utilities.DateManager.getNextBusinessDateFromInputtedDate
                (
                    _lastBusinessDate
                    , inputHolidayHash
                );
            while (_nextBusinessDate.Month == inputDateTime.Month)
            {
                _lastBusinessDate =
                    _nextBusinessDate;

                _nextBusinessDate =
                    initrode.utilities.DateManager.getNextBusinessDateFromInputtedDate
                    (
                        _lastBusinessDate
                        , inputHolidayHash
                    );
            }
            return _lastBusinessDate;
        }
        public static DateTime  getPreviousBusinessDateFromInputtedDate
                                (
                                    DateTime inputDateTime
                                    , Hashtable inputHolidayHash
                                )
        {
            DateTime _dateWithTimeOmitted =
                new DateTime
                    (
                        inputDateTime.Year
                        , inputDateTime.Month
                        , inputDateTime.Day
                    );
            _dateWithTimeOmitted =
                _dateWithTimeOmitted.AddDays(-1);
            while (
                        initrode.utilities.DateManager.isInputtedDateABusinessDate
                        (
                            _dateWithTimeOmitted
                            , inputHolidayHash
                        ) == false
                    )
            {
                _dateWithTimeOmitted =
                    _dateWithTimeOmitted.AddDays(-1);
            }
            return _dateWithTimeOmitted;
        }

        public static DateTime  getNextBusinessDateFromInputtedDate
                                (
                                    DateTime inputDateTime
                                    , Hashtable inputHolidayHash
                                )
        {
            DateTime _dateWithTimeOmitted =
                new DateTime
                    (
                        inputDateTime.Year
                        , inputDateTime.Month
                        , inputDateTime.Day
                    );
            _dateWithTimeOmitted.AddDays(1);
            while   (
                        initrode.utilities.DateManager.isInputtedDateABusinessDate
                        (
                            _dateWithTimeOmitted
                            ,inputHolidayHash
                        ) == false
                    )
            {
                _dateWithTimeOmitted.AddDays(1);
            }
            return _dateWithTimeOmitted;
        }

        public static bool      isInputtedDateABusinessDate
                                (
                                    DateTime inputDateTime
                                    ,Hashtable inputHolidayHash
                                )
        {
            DateTime _dateWithTimeOmitted =
                new DateTime
                    (
                        inputDateTime.Year
                        ,inputDateTime.Month
                        ,inputDateTime.Day
                    );
            if (_dateWithTimeOmitted.DayOfWeek == DayOfWeek.Saturday
                || _dateWithTimeOmitted.DayOfWeek == DayOfWeek.Sunday)
                return false;
            foreach (DateTime _holidayDate in inputHolidayHash.Keys)
            {
                if (
                        _holidayDate.Year == inputDateTime.Year
                        &amp;&amp; _holidayDate.Month == inputDateTime.Month
                        &amp;&amp; _holidayDate.Day == inputDateTime.Day
                    )
                {
                    return false;
                }
            }
            return true;
        }
        public static string    convertDateTimeToMMDDYYYY_WithoutSlashesOrDashes
                                (
                                    DateTime inputDateTime
                                )
        {
            StringBuilder _dateBldr =
                new StringBuilder();
            _dateBldr.AppendFormat
            (
                &#34;{0}{1}{2}&#34;
                , initrode.utilities.StringManager.Fill
                (
                    inputDateTime.Month.ToString()
                    , &#34;0&#34;
                    , true //from left
                    , 2
                )
                ,initrode.utilities.StringManager.Fill
                (
                    inputDateTime.Day.ToString()
                    , &#34;0&#34;
                    , true //from left
                    , 2
                )
                ,inputDateTime.Year.ToString()
            );
            return _dateBldr.ToString();
        }
        public static DateTime  convertMMDDYYYY_WithoutSlashesOrDashesToDateTime
                                (
                                    string inputMMDDYYYY
                                )
        {
            inputMMDDYYYY = 
                initrode.utilities.StringManager.StripWhitespace
                (
                    inputMMDDYYYY
                );
            StringBuilder _mmSlashddSlashyyyyBldr =
                new StringBuilder();
            _mmSlashddSlashyyyyBldr.AppendFormat
            (
                &#34;{0}/{1}/{2}&#34;
                ,inputMMDDYYYY.Substring(0,2)
                ,inputMMDDYYYY.Substring(2,2)
                ,inputMMDDYYYY.Substring(4,4)
            );
            if (
                    initrode.utilities.StringManager.IsValidDateInMM_DD_YYYYFormat
                    (
                        _mmSlashddSlashyyyyBldr.ToString()
                    ) == false
                )
                return new DateTime(1900, 1, 1);
            DateTime _returnDateTime =
                new DateTime
                    (
                        Convert.ToInt32
                        (
                            inputMMDDYYYY.Substring(4, 4)
                        )
                        , Convert.ToInt32
                        (
                            inputMMDDYYYY.Substring(0, 2)
                        )
                        , Convert.ToInt32
                        (
                            inputMMDDYYYY.Substring(2, 2)
                        )
                    );
            return _returnDateTime;
        }

		public static DateTime	convertDateInYYYYMMDDFormatToDateTime
								(
									string inputDateInYYYYMMDDFormat
								)
		{
			if (initrode.utilities.StringManager.IsValidDateInYYYYMMDDFormat(inputDateInYYYYMMDDFormat) == false) 
                return Convert.ToDateTime(&#34;1/1/1900&#34;);
			return new	DateTime
						(
							Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(0,4))
							,Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(4,2))
							,Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(6,2))
						);
		}
		public static DateTime	getNextPeriodStartDateFromGivenDate
								(
									DateTime inputDate
								)
		{
			if (inputDate.Day == 1) return inputDate;
			if (inputDate.Day == 16) return inputDate;
			if (inputDate.Day &lt;= 15) return inputDate.AddDays(16 - inputDate.Day);
			return inputDate.AddMonths(1).AddDays(1 - inputDate.Day);
		}
		public static DateTime	getNextPeriodEndDateFromGivenPeriodStartDate
								(
									DateTime inputPeriodStartDate
								)
		{
			if (inputPeriodStartDate.Day == 1) return inputPeriodStartDate.AddDays(15 - inputPeriodStartDate.Day);
			return inputPeriodStartDate.AddMonths(1).AddDays(0 - inputPeriodStartDate.Day);
		}

		public static DateTime	convertDateInYYYYMMDDFormatAndTimeInHHColonMIColonSSFormatToDateTime
								(
									string inputDateInYYYYMMDDFormat,
									string inputTimeInHHColonMIColonSSFormat
								)
		{
			inputDateInYYYYMMDDFormat = initrode.utilities.StringManager.StripWhitespaceFromEnds(inputDateInYYYYMMDDFormat);
			inputTimeInHHColonMIColonSSFormat = initrode.utilities.StringManager.StripWhitespaceFromEnds(inputTimeInHHColonMIColonSSFormat);
			if (inputDateInYYYYMMDDFormat.Length != 8 ||
				initrode.utilities.StringManager.IsValidDateInYYYYMMDDFormat(inputDateInYYYYMMDDFormat) == false) return new DateTime(1900,1,1);
		
			if (inputTimeInHHColonMIColonSSFormat.Length != 8 ||
				initrode.utilities.StringManager.IsValidTimeInHHColonMIColonSSFormat(inputTimeInHHColonMIColonSSFormat) == false)
					return new	DateTime 
								(
									Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(0,4)),
									Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(4,2)),
									Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(6,2))
								);

			return new	DateTime 
						( 
							Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(0,4)),
							Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(4,2)),
							Convert.ToInt32(inputDateInYYYYMMDDFormat.Substring(6,2)),
							Convert.ToInt32(inputTimeInHHColonMIColonSSFormat.Substring(0,2)),
							Convert.ToInt32(inputTimeInHHColonMIColonSSFormat.Substring(3,2)),
							Convert.ToInt32(inputTimeInHHColonMIColonSSFormat.Substring(6,2))
						);
		
		}
        public static bool validateTimestampInODBCCanonicalFormat
                           (
                              string inputTimestampInODBCCanonicalFormat
                           )
        {
            if (inputTimestampInODBCCanonicalFormat.Length != 23)
                return false;

            if (initrode.utilities.StringManager.IsValidNumber(inputTimestampInODBCCanonicalFormat.Substring(0, 4)) == false
                || initrode.utilities.StringManager.IsValidNumber(inputTimestampInODBCCanonicalFormat.Substring(5, 2)) == false
                || initrode.utilities.StringManager.IsValidNumber(inputTimestampInODBCCanonicalFormat.Substring(8, 2)) == false
                || initrode.utilities.StringManager.IsValidNumber(inputTimestampInODBCCanonicalFormat.Substring(11, 2)) == false
                || initrode.utilities.StringManager.IsValidNumber(inputTimestampInODBCCanonicalFormat.Substring(14, 2)) == false
                || initrode.utilities.StringManager.IsValidNumber(inputTimestampInODBCCanonicalFormat.Substring(17, 2)) == false
                || initrode.utilities.StringManager.IsValidNumber(inputTimestampInODBCCanonicalFormat.Substring(20, 3)) == false)
                return false;

            string _yyyy =
                inputTimestampInODBCCanonicalFormat.Substring(0, 4);
            string _mm =
                inputTimestampInODBCCanonicalFormat.Substring(5, 2);
            string _dd =
                inputTimestampInODBCCanonicalFormat.Substring(8, 2);
            if (initrode.utilities.StringManager.IsValidDate
                (
                    _mm
                    ,_dd
                    ,_yyyy
                ) == false)
                return false;

            StringBuilder _timeBldr =
                new StringBuilder();
            _timeBldr.Append
            (
                inputTimestampInODBCCanonicalFormat.Substring(11, 2)
            );
            _timeBldr.Append
            (
                &#34;:&#34;
            );
            _timeBldr.Append
            (
                inputTimestampInODBCCanonicalFormat.Substring(14, 2)
            );
            _timeBldr.Append
            (
                &#34;:&#34;
            );
            _timeBldr.Append
            (
                inputTimestampInODBCCanonicalFormat.Substring(17, 2)
            );
            if (initrode.utilities.StringManager.IsValidTimeInHHColonMIColonSSFormat
                (
                    _timeBldr.ToString()
                ) == false)
                return false;
            return true;
        }
        public static DateTime  convertTimestampInODBCCanonicalFormatToDateTime
                                (
                                    string inputTimestampInODBCCanonicalFormat
                                )
        {
            if (validateTimestampInODBCCanonicalFormat
                    (
                        inputTimestampInODBCCanonicalFormat
                     ) == false)
                return new DateTime(1900, 1, 1);

            int _yyyy = 
                Convert.ToInt32(inputTimestampInODBCCanonicalFormat.Substring(0,4));
            int _mm = 
                Convert.ToInt32(inputTimestampInODBCCanonicalFormat.Substring(5,2));
            int _dd = 
                Convert.ToInt32(inputTimestampInODBCCanonicalFormat.Substring(8,2));

            int _hh =
                Convert.ToInt32(inputTimestampInODBCCanonicalFormat.Substring(11, 2));
            int _mi =
                Convert.ToInt32(inputTimestampInODBCCanonicalFormat.Substring(14, 2));
            int _ss =
                Convert.ToInt32(inputTimestampInODBCCanonicalFormat.Substring(17, 2));
            int _ms =
                Convert.ToInt32(inputTimestampInODBCCanonicalFormat.Substring(20, 3));
            return new DateTime
                        (
                            _yyyy
                            , _mm
                            , _dd
                            , _hh
                            , _mi
                            , _ss
                            , _ms
                         );   
        }

		/** 
		 * 
		 * @description get first day of the current month
		 * **/
		public static DateTime getFirstDayofTheCurrentMonth() 
		{
			return initrode.utilities.DateManager.getFirstDayofTheMonth(System.DateTime.Now);
		}

        public static DateTime convertDateTimeToDate
                                (
                                    DateTime inputTimestamp
                                )
        {
            DateTime _returnDate =
                new DateTime
                    (
                        inputTimestamp.Year
                        ,inputTimestamp.Month
                        ,inputTimestamp.Day
                    );
            return _returnDate;
        }
		/**
		 * @description get the last day of the month
		 * */
							   	
		public static DateTime getLastDayOfTheMonth( System.DateTime inputDateTime) 
		{
			return initrode.utilities.DateManager.getFirstDayofNextMonth(inputDateTime).AddDays(-1);
		}
		/** 
		 * @description get last day of the current month
		 * **/
		public static DateTime getLastDayofTheCurrentMonth() 
		{
			return initrode.utilities.DateManager.getLastDayOfTheMonth(DateTime.Now);
		}

		/** 
		 * Convert the DateTime value to YYYYMMDD format
		 * **/
		public static string convertDateTimeToYYYYMMDDFormat(DateTime inputDateTime)
		{
			StringBuilder _dateBldr = new StringBuilder();
			_dateBldr.Append(inputDateTime.Year.ToString());
			_dateBldr.Append(initrode.utilities.StringManager.Fill(inputDateTime.Month.ToString(),&#34;0&#34;,true,2));
			_dateBldr.Append(initrode.utilities.StringManager.Fill(inputDateTime.Day.ToString(),&#34;0&#34;,true,2));
			return _dateBldr.ToString();
		}
		/** 
		 * Convert the DateTime value to MM, DD, YYYY character parts
		 * **/
		public static void convertDateTimeToMM_DD_YYYYStringParts(DateTime inputDateTime,
																	out string outputMM,
																	out string outputDD,
																	out string outputYYYY)
		{
			string _date_in_MM_DD_YYYY_Format = 
				convertDateTimeToMM_DD_YYYYFormat(inputDateTime);
			outputMM = &#34;&#34;;
			outputDD = &#34;&#34;;
			outputYYYY = &#34;&#34;;

			outputMM = _date_in_MM_DD_YYYY_Format.Substring(0,2);
			outputDD = _date_in_MM_DD_YYYY_Format.Substring(3,2);
			outputYYYY = _date_in_MM_DD_YYYY_Format.Substring(6,4);
		}
		/** 
		 * Convert the DateTime value to MM_DD_YYYY format.
		 * **/
		public static DateTime convertMM_DD_YYYYFormatToDateTime(string inputDateInMM_DD_YYYYFormat)
		{
			inputDateInMM_DD_YYYYFormat = initrode.utilities.StringManager.StripWhitespaceFromEnds(inputDateInMM_DD_YYYYFormat);
			if (initrode.utilities.StringManager.IsValidDateInMM_DD_YYYYFormat(inputDateInMM_DD_YYYYFormat) == false) return new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
			int _intMM = Convert.ToInt32(inputDateInMM_DD_YYYYFormat.Substring(0,2));
			int _intDD = Convert.ToInt32(inputDateInMM_DD_YYYYFormat.Substring(3,2));
			int _intYYYY = Convert.ToInt32(inputDateInMM_DD_YYYYFormat.Substring(6,4));
			return new DateTime(_intYYYY,_intMM, _intDD);
		}
        public static int calculateMonthsDifferenceBetweenTwoDates
                            (
                                DateTime inputOlderDate
                                , DateTime inputNewerDate
                            )
        {
            DateTime _tempDate = inputOlderDate;
            int _numberOfMonthsDifference = 0;
            while (_tempDate &lt; inputNewerDate)
            {
                _tempDate = _tempDate.AddMonths(1);
                if (_tempDate &lt; inputNewerDate)
                    _numberOfMonthsDifference++;
            }
            return _numberOfMonthsDifference;
        }

		/** 
		 * Convert the DateTime value to MM_DD_YYYY format.
		 * **/
		public static string convertTimestampToStringFormat(DateTime inputDateTime)
		{
			StringBuilder _bldr = new StringBuilder();
			_bldr.Append(initrode.utilities.StringManager.Fill(	
												inputDateTime.Month.ToString(),
												&#34;0&#34;,
												true,           //Fill from left
												2));
			_bldr.Append(&#34;/&#34;);
			_bldr.Append(initrode.utilities.StringManager.Fill(	
												inputDateTime.Day.ToString(),
												&#34;0&#34;,
												true,           //Fill from left
												2));
			_bldr.Append(&#34;/&#34;);
			_bldr.Append(inputDateTime.Year.ToString());
			_bldr.Append(&#34; &#34;);
			_bldr.Append(initrode.utilities.StringManager.Fill(	
												inputDateTime.Hour.ToString(),
												&#34;0&#34;,
												true,           //Fill from left
												2));
			_bldr.Append(&#34;:&#34;);
			_bldr.Append(initrode.utilities.StringManager.Fill(	
												inputDateTime.Minute.ToString(),
												&#34;0&#34;,
												true,           //Fill from left
												2));
			_bldr.Append(&#34;:&#34;);
			_bldr.Append(initrode.utilities.StringManager.Fill(	
												inputDateTime.Second.ToString(),
												&#34;0&#34;,
												true,           //Fill from left
												2));
			_bldr.Append(&#34;.&#34;);
			_bldr.Append(initrode.utilities.StringManager.Fill(	
												inputDateTime.Millisecond.ToString(),
												&#34;0&#34;,
												true,           //Fill from left
												3));

			return _bldr.ToString();
		}

		/** 
		 * Convert the DateTime value to MM_DD_YYYY format.
		 * **/
		public static string convertDateTimeToMM_DD_YYYYFormat(DateTime inputDateTime)
		{
			StringBuilder _bldr = new StringBuilder();
			_bldr.Append(initrode.utilities.StringManager.Fill(	
												inputDateTime.Month.ToString(),
												&#34;0&#34;,
												true,           //Fill from left
												2));
			_bldr.Append(&#34;/&#34;);
			_bldr.Append(initrode.utilities.StringManager.Fill(	
												inputDateTime.Day.ToString(),
												&#34;0&#34;,
												true,           //Fill from left
												2));
			_bldr.Append(&#34;/&#34;);
			_bldr.Append(inputDateTime.Year.ToString());
			return _bldr.ToString();
		}

		/** 
		 * @description get first day of the next  month
		 * **/
		public static DateTime getFirstDayofNextMonth(DateTime inputDateTime) 
		{
			return  initrode.utilities.DateManager.getFirstDayofTheMonth(inputDateTime).AddMonths(1);
		}


		/** 
		 * @description get first day of the next  month
		 * **/
		public static DateTime getFirstDayofNextMonth() 
		{
			return  getFirstDayofNextMonth(DateTime.Now); 
		}

		/** 
		 * @description add days to a date
		 * **/
		public static DateTime daysFromTheFirst(int days, System.DateTime date)
		{
			DateTime nextDate = date.AddDays(days); //calculate  1 day of next month
			return nextDate;
		}
		/** 
		 * 
		 * @description get first day of the current year
		 * **/
		public static DateTime getFirstDayofTheCurrentYear() 
		{
			return initrode.utilities.DateManager.getFirstDayofTheInputtedDatesYear(System.DateTime.Now);
		}
		/** 
		 * 
		 * @description get last day of the current year
		 * **/
		public static DateTime getLastDayofTheCurrentYear() 
		{
			return initrode.utilities.DateManager.getFirstDayofTheCurrentYear().AddYears(1).AddDays(-1);
		}

		/** 
		 * 
		 * @description get first day of the inputted year
		 * **/
		public static DateTime getFirstDayofTheInputtedDatesYear(System.DateTime inputDateTime) 
		{
			return new DateTime(inputDateTime.Year,1,1);
		}
		/** 
		 * 
		 * @description get last day of the inputted year
		 * **/
		public static DateTime getLastDayofTheInputtedDatesYear(System.DateTime inputDateTime) 
		{
			return new DateTime(inputDateTime.Year,12,31);
		}

		public static DateComparison timestamp1ComparedToTimestamp2(DateTime inputTimestamp1, 
																	DateTime inputTimestamp2)
		{
			if (inputTimestamp1.Year &gt; inputTimestamp2.Year) return DateComparison.gt;
			if (inputTimestamp1.Year &lt; inputTimestamp2.Year) return DateComparison.lt;
			if (inputTimestamp1.DayOfYear &gt; inputTimestamp2.DayOfYear) return DateComparison.gt;
			if (inputTimestamp1.DayOfYear &lt; inputTimestamp2.DayOfYear) return DateComparison.lt;
			if (inputTimestamp1.Hour &gt; inputTimestamp2.Hour) return DateComparison.gt;
			if (inputTimestamp1.Hour &lt; inputTimestamp2.Hour) return DateComparison.lt;
			if (inputTimestamp1.Minute &gt; inputTimestamp2.Minute) return DateComparison.gt;
			if (inputTimestamp1.Minute &lt; inputTimestamp2.Minute) return DateComparison.lt;
			if (inputTimestamp1.Second &gt; inputTimestamp2.Second) return DateComparison.gt;
			if (inputTimestamp1.Second &lt; inputTimestamp2.Second) return DateComparison.lt;
			if (inputTimestamp1.Millisecond &gt; inputTimestamp2.Millisecond) return DateComparison.gt;
			if (inputTimestamp1.Millisecond &lt; inputTimestamp2.Millisecond) return DateComparison.lt;
			return DateComparison.eq;
		
		}

		public static DateComparison date1ComparedToDate2(DateTime inputDate1, 
															DateTime inputDate2)
		{
			if (inputDate1.Year &gt; inputDate2.Year) return DateComparison.gt;
			if (inputDate1.Year &lt; inputDate2.Year) return DateComparison.lt;
			if (inputDate1.DayOfYear &gt; inputDate2.DayOfYear) return DateComparison.gt;
			if (inputDate1.DayOfYear &lt; inputDate2.DayOfYear) return DateComparison.lt;
			return DateComparison.eq;
		
		}

		/** 
		 * 
		 * @description get first day of the first Future Period
		 * **/
		public static DateTime getTheDateBeforeTheFirstFuturePeriod() 
		{
			// If date is less than the 16th, the 15th is the date.

			DateTime _date = DateTime.Now;
			if (_date.Day &lt; 16)
			{
				return _date.AddDays(15 - _date.Day);
			}

			// If date is greater than the 16th, the 1st of the following month is
			// the first date of the first future period.

			return _date.AddDays(1 - _date.Day).AddMonths(1).AddDays(-1);
		}
	}
}</code></pre>
<!-- Easy Reader Version: The article WAS the easy reader version. Look at this thing. -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/buildmaster-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/BuildMaster?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Self_Service&amp;utm_campaign=Buildmaster_Footer">BuildMaster</a> allows you to create a self-service release management platform that allows different teams to manage their applications. <a href="https://inedo.com/BuildMaster/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Self_Service&amp;utm_campaign=Buildmaster_Footer">Explore how!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=iuIXXz86C28:Cjy2v1zA1WU:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/iuIXXz86C28" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"35";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:64:"https://thedailywtf.com/articles/comments/driven-to-substraction";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"CodeSOD: Compiled Correctly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/compiled-correctly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 08 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/compiled-correctly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5712:"<p>Properly used, version history can easily help you track down and identify the source of a bug. Improperly used, it still can. As previously established, the chief architect <strong>Dana</strong> works with <a href="https://thedailywtf.com/articles/butting-in">has some issues with source control</a>.</p>

<p><strong>Dana</strong> works on a large, complex embedded system. “Suddenly”, her team started to spot huge piles of memory corruption problems. <em>Something</em> was misbehaving, but it was hard to see exactly <em>what</em>.</p>

<p>They ported Valgrind to their platform, just so they could try and figure out what was going wrong. Eventually, they tracked the problem down to a pair of objects.</p>

<p>In the flow of the code, the correct path was that object A, which we’ll call <code>Monster</code> would be allocated. <em>Then</em> a second object would be allocated. Somehow, <code>Monster</code> instances were corrupting the memory of the second object.</p>

<p>How does an object allocated earlier corrupt the memory of an object allocated later? Well, “before” and “after” have different meaning when your code is multi-threaded, which this was. Worse, the <code>Monster</code> class was <a href="https://en.wikipedia.org/wiki/Katamari_damacy">katamari</a> of functionality rolled up across thousands of lines of code. <!-- Sorry, I just finally got around to playing the PC re-release of the game- just as good as I remembered, but much much shorter than I remembered --> Obviously, there had to be a race condition- but a quick glance at all the <code>Monster</code> methods showed that they were using a mutex to avoid the race condition.</p>

<p>Or were they? Dana looked more closely. One of the methods called during the initialization process, <code>doSomething</code>, was marked <code>const</code>. In C++, that should mean that the method doesn’t change any property values. But if it doesn’t change any property values, how can it lock the mutex?</p>

<p>This is where walking through the commit history tells a story. “Fortunately” this was before Jerry learned you could amend a commit, so each step of his attempts to get the code to compile are recorded for posterity.</p>

<p>The chain of commits started with one labeled “Add Feature $X”, and our <code>doSomething</code> method looked like this.</p>
<pre><code class="cplusplus">  void doSomething() const {
      Mutex::ScopedLock lock(mutex);
      // Dozens of lines of code
  }</code></pre>

<p>Now, the <em>intent</em> here was to create a <code>ScopedLock</code> object based off a <code>mutex</code> property. But that required the <code>mutex</code> property to change, which violated <code>const</code>, which meant this didn’t even compile.</p>

<p>Which brings up our next commit, labeled “Fix compile failure”:</p>
<pre><code class="cplusplus">  void doSomething() const {
      Mutex::ScopedLock lock(mutex) const;
      // Dozens of lines of code
  }</code></pre>

<p>Surprisingly, just slapping the <code>const</code> declaration on the variable initialization didn’t do anything. The next commit, also helpfully labeled “Fix compile failure”:</p>
<pre><code class="cplusplus">  void doSomething() const {
      Mutex::ScopedLock lock(const mutex);
      // Dozens of lines of code
  }</code></pre>

<p>Again, this didn’t work. Which brings us to the last “Fix compile failure” commit in this chain:</p>
<pre><code class="cplusplus">  void doSomething() const {
      Mutex::ScopedLock lock(const Mutex mutex);
      // Dozens of lines of code
  }</code></pre>

<p>By randomly adding and subtracting symbols, Jerry was able to <em>finally</em> write a function which compiles. Unfortunately, it also doesn’t <em>work</em>, because this time, the line of code is a function declaration for a function with no implementation. It takes a mutex as a parameter, and returns a lock on that mutex. Since the declaration has no implementation, if we ever tried to call this in <code>doSomething</code>, we’d get an error, but we don’t, because this was always meant to be a constructor.</p>

<p>The end result is that nothing gets locked. Thus, the race condition means that sometimes, two threads contend with each other and corrupt memory. Dana was able to fix this method, but the root cause was only fixed when Jerry left Initech to be a CTO elsewhere.</p>
<!-- Easy Reader Version: I mean, I'm sad that Jerry isn't there anymore. He seems like great story fodder. -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">ProGet</a> can centralize your organization&#39;s software applications and components to provide uniform access to developers and servers. <a href="http://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">Check it out!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=pT9sgSN4FB4:ufs5GMyqIww:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/pT9sgSN4FB4" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"24";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:60:"https://thedailywtf.com/articles/comments/compiled-correctly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"CodeSOD: Generically Bad";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://thedailywtf.com/articles/generically-bad";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 07 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:48:"https://thedailywtf.com/articles/generically-bad";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:7557:"<p>The first two major releases of the .NET Framework, 1.0 and 1.1 were… not good. It&#39;s so long ago now that they&#39;re easily forgotten, but it&#39;s important to remember that a lot of core language features weren&#39;t in the framework until .NET 2.0.</p>
<p>Like generics. Generics haven&#39;t always been part of the language, but they&#39;ve been in the language since 2006. The hope would be that, in the course of 13 years, developers would learn to use this feature.</p>
<p><strong>Russell F</strong> (<a href="https://thedailywtf.com/articles/trim-off-a-few-miles">recently</a>) has a co-worker who is still working on it.</p>
<pre><code class="language-csharp"><div><span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> DataTable ClassRegionDToDatatable&lt;POSInvoiceRegionD&gt;(<span class="hljs-keyword">string</span> tableName) <span class="hljs-keyword">where</span> POSInvoiceRegionD : <span class="hljs-keyword">class</span>
{
    Type classType = <span class="hljs-keyword">typeof</span>(POSInvoiceRegionD);
    DataTable result = <span class="hljs-keyword">new</span> DataTable(tableName);

    <span class="hljs-keyword">foreach</span> (PropertyInfo property <span class="hljs-keyword">in</span> classType.GetProperties())
    {
        DataColumn column = <span class="hljs-keyword">new</span> DataColumn();
        column.ColumnName = property.Name;
        column.DataType = property.PropertyType;

        result.Columns.Add(column);
    }
    <span class="hljs-keyword">return</span> result;
}

<span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> DataTable ClassRegionFToDatatable&lt;POSInvoiceRegionF&gt;(<span class="hljs-keyword">string</span> tableName) <span class="hljs-keyword">where</span> POSInvoiceRegionF : <span class="hljs-keyword">class</span>
{
    Type classType = <span class="hljs-keyword">typeof</span>(POSInvoiceRegionF);
    DataTable result = <span class="hljs-keyword">new</span> DataTable(tableName);

    <span class="hljs-keyword">foreach</span> (PropertyInfo property <span class="hljs-keyword">in</span> classType.GetProperties())
    {
        DataColumn column = <span class="hljs-keyword">new</span> DataColumn();
        column.ColumnName = property.Name;
        column.DataType = property.PropertyType;

        result.Columns.Add(column);
    }
    <span class="hljs-keyword">return</span> result;
}

<span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> DataTable ClassRegionGToDatatable&lt;POSInvoiceRegionG&gt;(<span class="hljs-keyword">string</span> tableName) <span class="hljs-keyword">where</span> POSInvoiceRegionG : <span class="hljs-keyword">class</span>
{
    Type classType = <span class="hljs-keyword">typeof</span>(POSInvoiceRegionG);
    DataTable result = <span class="hljs-keyword">new</span> DataTable(tableName);

    <span class="hljs-keyword">foreach</span> (PropertyInfo property <span class="hljs-keyword">in</span> classType.GetProperties())
    {
        DataColumn column = <span class="hljs-keyword">new</span> DataColumn();
        column.ColumnName = property.Name;
        column.DataType = property.PropertyType;

        result.Columns.Add(column);
    }
    <span class="hljs-keyword">return</span> result;
}

<span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> DataTable ClassRegionKToDatatable&lt;POSInvoiceRegionK&gt;(<span class="hljs-keyword">string</span> tableName) <span class="hljs-keyword">where</span> POSInvoiceRegionK : <span class="hljs-keyword">class</span>
{
    Type classType = <span class="hljs-keyword">typeof</span>(POSInvoiceRegionK);
    DataTable result = <span class="hljs-keyword">new</span> DataTable(tableName);

    <span class="hljs-keyword">foreach</span> (PropertyInfo property <span class="hljs-keyword">in</span> classType.GetProperties())
    {
        DataColumn column = <span class="hljs-keyword">new</span> DataColumn();
        column.ColumnName = property.Name;
        column.DataType = property.PropertyType;

        result.Columns.Add(column);
    }
    <span class="hljs-keyword">return</span> result;
}
</div></code></pre>
<p>Now, the core idea behind generics is that code which <em>is</em> generic doesn&#39;t particularly care about what data-type it&#39;s working on. A generic list handles inserts and other list operations without thinking about what it&#39;s actually touching.</p>
<p>So, right off the bat, the fact that we have a pile of generic methods which all contain the same code is a simple hint that something&#39;s gone terribly wrong.</p>
<p>In this case, each of these methods takes a type parameter (which happens, in this case, to be named just like one of the actual classes we use), and then generates an empty DataTable with the columns configured to match the class. So, for example, you might do:</p>
<pre><code class="language-csharp"><div>DataTable d = POSInvoiceRegionUtils.ClassRegionDToDatatable&lt;POSInvoiceRegionD&gt;(<span class="hljs-string">&#34;the_d&#34;</span>);
</div></code></pre>
<p>Of course, because these methods are all generic and accept type parameters, you could just as easily…</p>
<pre><code class="language-csharp"><div>DataTable d = POSInvoiceRegionUtils.ClassRegionKToDatatable&lt;POSInvoiceRegionD&gt;(<span class="hljs-string">&#34;the_d&#34;</span>);
</div></code></pre>
<p>Not that such a counterintuitive thing ever happens. By the way, did you notice how these regions are named with letters? And you know how the alphabet has 26 of them? Well, while they&#39;re not using all 26 letters, there are a <em>lot</em> more regions than illustrated here, and they all get the same <code>ClassRegion{x}ToDatatable</code> implementation.</p>
<p>So yes, we could boil all of these implementations down into one. Then again, should we? <code>GetProperties</code> is one of .NET&#39;s reflection methods, which lets us examine the definition of class objects. Using it isn&#39;t <em>wrong</em>, but it&#39;s always <em>suspicious</em>. Perhaps we don&#39;t need <em>any</em> of this code? Without more information, it&#39;s hard to say, but Russell adds:</p>
<blockquote>
<p>I&#39;m going to leave aside the question of whether this is something that should be done at all to focus on the fact that it&#39;s being done in a really bizarre way.</p>
</blockquote>
<p>I&#39;m not sure about &#34;bizarre&#34;, but wrong? Definitely. Definitely wrong.</p>
<!-- Easy Reader Version: Reflect on your generics -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Ensure your software is built only once and then deployed consistently across environments, by packaging your applications and components. <a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Consistently&amp;utm_campaign=ProGet_Footer">Learn how</a> today!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=N9O2vn_B7pQ:s1LvbSzFbPQ:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/N9O2vn_B7pQ" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:57:"https://thedailywtf.com/articles/comments/generically-bad";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Mark Bowytz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:53:"Error&#039;d: An Error Storm of Monstrous Proportions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"https://thedailywtf.com/articles/an-error-storm-of-monstrous-proportions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"Error'd";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Fri, 04 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:72:"https://thedailywtf.com/articles/an-error-storm-of-monstrous-proportions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2875:"<p>&#34;Move over NOAA, Google News shows us, unfortunately <a href="https://en.wikipedia.org/wiki/Hurricane_Dorian">after the fact</a> that The Daily Beast is the TRUEST hurricane prognosticator,&#34; <strong>Alejandro D.</strong> writes.
</p><blockquote><p><a href="#Pic-2"><img itemprop="image" border="0" alt="" src="//thedailywtf.com/images/19/q3/e383/Pic-2.jpg"/></a></p><p> </p></blockquote>

<p>&#34;Um...So, these are so my car can listen to music, wirelessly, because its mirrors are its...er...ears??&#34; <strong>Paul</strong> writes.
</p><blockquote><p><a href="#Pic-1"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e383/Pic-1.jpg"/></a></p><p> </p></blockquote>

<p><strong>Jyri B.</strong> wrote, &#34;You know, it&#39;s really nice to see that the Eurovision people are embracing <u>all</u> the European languages.&#34;
</p><blockquote><p><a href="#Pic-3"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e383/Pic-3.jpg"/></a></p><p> </p></blockquote>

<p>&#34;Wow! Maltese looks like a tough language to learn. Glad I don&#39;t have to know it. Thank YOU Google Translate!&#34; <strong>Peter K.</strong> writes.
</p><blockquote><p><a href="#Pic-4"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e383/Pic-4.jpg"/></a></p><p> </p></blockquote>

<p>&#34;At Gamestop, you can pre-order figurines of all your favoirte characters from MSI!&#34; wrote <strong>Chris A.</strong>
</p><blockquote><p><a href="#Pic-5"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e383/Pic-5.png"/></a></p><p> </p></blockquote>

<p><strong>Mikkel H.</strong> writes, &#34;I don&#39;t want to hear about timezone issues. The only thing possible that happened here was that my FedEx package was teleported from Beijing to Anchorage and back again.&#34;
</p><blockquote><p><a href="#Pic-6"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e383/Pic-6.png"/></a></p><p> </p></blockquote>
<div>
	<img src="https://thedailywtf.com/images/inedo/otter-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/otter?utm_source=tdwtf&amp;utm_medium=Footerad&amp;utm_term=2018&amp;utm_content=Provision&amp;utm_campaign=Otter_Footer">Otter</a> - Provision your servers automatically without ever needing to log-in to a command prompt. <a href="https://inedo.com/otter/download?utm_source=tdwtf&amp;utm_medium=Footerad&amp;utm_term=2018&amp;utm_content=Provision&amp;utm_campaign=Otter_Footer">Get started today!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=vwJKXYg_KXA:i3bBvFF2gko:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/vwJKXYg_KXA" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"14";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:81:"https://thedailywtf.com/articles/comments/an-error-storm-of-monstrous-proportions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"The Windows Update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/the-windows-update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:16:"Feature Articles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 03 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/the-windows-update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5480:"<p>Every change breaks someones workflow.</p>

<p>A few years ago, <strong>Ian</strong> started at one of the many investment banks based out of London. This particular bank was quite proud of how they integrated “the latest technology” into all their processes, “favoring the bleeding edge,” and “are always focusing on Agile methods, and cross-functional collaboration.”</p>

<p>That last bit is why every software developer was on a tech support rotation. Every two weeks, they’d have to spend a day sitting with the end users, watching them work. Ostensibly, by seeing how the software was actually used, the developers would have a better sense of the users’ needs. In practice, they mostly showed people how to delete emails or recover files from the recycling bin.</p>

<p>Unfortunately, these end users <em>also</em> directly or indirectly controlled the bank’s budgeting process, so keeping them happy was a big part of ensuring continued employment. Not just service, but service with a smile- or <em>else</em>.</p>

<p>Ian’s problem customer was Jacob. Jacob had been with the bank at least thirty years, and still longed for the days of lunchtime brandy and casual sexual harassment. He did <em>not</em> like computers. He did not like the people who serviced his computer. He did not like it when a web page displayed incorrectly, and he especially did not like it when you explained that you couldn’t edit the web page you didn’t own, and couldn’t tell Microsoft to change Internet Explorer to work with that particular website.</p>

<p>“I understand you smart technical kids are just a cost of doing business,” Jacob would often say, “but your budget is out of control. Something must be done!”</p>

<p>Various IT projects proceeded apace. Jacob continued to try and cut their budget. And then the Windows 7 rollout happened.</p>

<p>This was a massive effort. They had been on Windows XP. A variety of intranet and proprietary applications didn’t work on Windows 7, and needed to be upgraded. Even with those upgrades, everyone knew that there would be more problems. These big changes never came without unexpected side effects.</p>

<p>The day Jacob got Windows 7 imaged onto his computer also happened to be the day Ian was on helldesk duty. Ian got a frantic email:</p>

<blockquote>
<p>My screen is broken! Everything is wrong! COME TO MY DESK RIGHT NOW, YOUNG MAN</p>
</blockquote>

<p>Ian had already prepared, and went right ahead and changed Jacob’s desktop settings so that they as closely mimicked Windows XP as possible.</p>

<p>“That’s all fine and good,” Jacob said, “but it’s still <em>broken</em>.”</p>

<p>Ian looked at the computer. Nothing was broken. “What… what exactly is the problem?”</p>

<p>“Internet Explorer is broken!”</p>

<p>Ian double clicked the IE icon. The browser launched just fine, and pulled up the company home page.</p>

<p>“No! Close that window, and look at the desktop!”</p>

<p>Ian did so, waiting for Jacob to explain the problem. Jacob waited for Ian to see the problem. They both sat there, waiting, no one willing to move until the other had gone.</p>

<p>Jacob broke first. “The icon is wrong!”</p>

<p>Ah, yes, the big-blue-E of Windows XP had been replaced by the big-blue-E of Windows 7.</p>

<p>“This is unacceptable!” Jacob said.</p>

<p>Ian had already been here for most of the morning, so a few more minutes made no difference. He fired up image search, grabbed the first image which was an XP era IE icon, and then set that as the icon on the desktop.</p>

<p>Jacob squinted. “Nope. No, I don&#39;t like that. It’s too smooth.”</p>

<p>Of course. Ian had grabbed the first image, which was much higher resolution than the original icon file. “I… see. Give me a minute.”</p>

<p>Ian went back to his desk, resized the image, threw it on a network share, went back to Jacob’s desk, and changed the icon.</p>

<p>“There we are,” Jacob said. “At least <em>someone</em> on your team knows how to support their users. It’s not just about making changes willy-nilly, you know. Good work!”</p>

<p>That was the first and only honest compliment Jacob ever gave Ian. Two years later, Ian moved on to a new job, leaving Jacob with his old IE icon, sitting at the same desk he’d been since before the Internet was even a “thing”.</p>
<!-- Easy Reader Version: There are so many versions of this basic story --><div>
	<img src="https://thedailywtf.com/images/inedo/buildmaster-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/BuildMaster?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Self_Service&amp;utm_campaign=Buildmaster_Footer">BuildMaster</a> allows you to create a self-service release management platform that allows different teams to manage their applications. <a href="https://inedo.com/BuildMaster/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Self_Service&amp;utm_campaign=Buildmaster_Footer">Explore how!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=g60TZ7GFTw4:_UUkYxSj-Pw:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/g60TZ7GFTw4" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"34";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:60:"https://thedailywtf.com/articles/comments/the-windows-update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"CodeSOD: An Updated Version";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/an-updated-version";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 02 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:51:"https://thedailywtf.com/articles/an-updated-version";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3299:"<p>Some folks were perplexed by the fact that Microsoft skipped Windows 9 and went straight to Windows 10. The urban legend is that so many old applications checked which version of Windows was running by doing something like <code>version.startsWith(&#34;Windows 9&#34;)</code> to see if they were on 95 or 98, that Microsoft risked breaking otherwise working code if they released Windows 9.</p>

<p>But gone are those days of doing string munging to check which version of an OS we’re running on. We’ve got much better ways to check what features and functionality are available without having to parse strings out, right?</p>

<p><strong>John D</strong> found some TypeScript code in a Ionic app that needs to adapt to different versions of iOS:</p>
<pre><code class="typescript">private iOS13Device(): boolean {
		// fix for ios 13 pan end issue
		if (
			this.isIOS13Device === undefined &amp;&amp;
			this.deviceService.isiOS &amp;&amp;
			this.deviceInfoService.deviceInfo &amp;&amp;
			this.deviceInfoService.deviceInfo.osVersion &amp;&amp;
			this.deviceInfoService.deviceInfo.osVersion.indexOf(&#39;_&#39;) &amp;&amp;
			this.deviceInfoService.deviceInfo.osVersion.split(&#39;_&#39;) &amp;&amp;
			this.deviceInfoService.deviceInfo.osVersion.split(&#39;_&#39;)[0] &amp;&amp;
			this.deviceInfoService.deviceInfo.osVersion.split(&#39;_&#39;)[0] === &#39;11&#39;
		) {
			this.isIOS13Device = true;
			return this.isIOS13Device;
		} else {
			this.isIOS13Device = false;
			return this.isIOS13Device;
		}
	}</code></pre>

<p>Well, at least they’re caching the result.</p>

<p>Also, I’m no expert on iOS device strings, but this seems to imply that an <code>iOS13Device</code> (an OS which just came out recently) reports its OS version number as a string starting with <code>11</code>. Maybe that’s correct, but in either case, that seems like a bonus WTF.</p>
<!-- Easy Reader Version: No, I do not think that Microsoft skipped 9 for that reason, because they could have easily found a way to trick that out in how they report the OS version string, like using Windows 09 or Windows v9 -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">ProGet</a> can centralize your organization&#39;s software applications and components to provide uniform access to developers and servers. <a href="http://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">Check it out!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=n2xCD_L4vFw:-GHU0c7nSWA:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/n2xCD_L4vFw" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"27";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:60:"https://thedailywtf.com/articles/comments/an-updated-version";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Jane Bailey";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"When Unique Isn&#039;t Unique";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://thedailywtf.com/articles/when-unique-isn-t-unique";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:16:"Feature Articles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 01 Oct 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:57:"https://thedailywtf.com/articles/when-unique-isn-t-unique";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3958:"<p style="float:right; padding-left:10px; padding-bottom:10px;"><a title="No machine-readable author provided. Museo8bits assumed (based on copyright claims). [CC BY-SA 2.5 (https://creativecommons.org/licenses/by-sa/2.5)], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Palm_III_24.jpg"><img itemprop="image" width="300" alt="Palm III 24" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Palm_III_24.jpg/512px-Palm_III_24.jpg"/></a></p>

<p>Gather &#39;round, young&#39;uns, for a tale from the Dark Ages of mobile programming: the days before the iPhone launched. Despite what Apple might have you believe, the iPhone wasn&#39;t the first portable computing device. Today&#39;s submitter, <b>Jack</b>, was working for a company that streamed music to these non-iPhone devices, such as the <a href="https://en.wikipedia.org/wiki/Palm_Treo" target="_blank">Palm Treo</a> or the <a href="https://en.wikipedia.org/wiki/Samsung_i607_BlackJack" target="_blank">Samsung Blackjack</a>. As launch day approached for the new client for Windows Mobile 6, our submitter realized that he&#39;d yet to try the client on a non-phone device (called a PDA, for those of you too young to recall). So he tracked down an <a href="https://en.wikipedia.org/wiki/IPAQ" target="_blank">HP iPaq</a> on eBay just so he could verify that it worked on a device without the phone API.</p>

<p>The device arrived a few days out from launch, after QA had already approved the build on other devices. It should&#39;ve been a quick test: sideload the app, stream a few tracks, log in, log out. But when Jack opened the app for the first time on the new device, it was already logged into someone&#39;s account! He closed it and relaunched, only to find himself in a different, also inappropriate account. What on earth?!</p>

<p>The only thing Jack could find in common between the users he was logged in as was that they were running the same model of PDA. That was the crucial key to resolving the issue. To distinguish which device was making the calls to the streaming service, Jack used a call in Windows Mobile that would return a unique ID for each mobile device. In most devices, it would base this identifier on the IMEI, ensuring uniqueness—but not on the HP iPaq. All HP devices could automatically log into the account of the most recently used iPaq, providing the user logged out and back in, as it would generate a recent-user record with the device ID.</p>

<p>Jack had read the documentation many times, and it always stated that the ID was guaranteed to be unique. Either HP had a different definition of &#34;unique&#34; than anyone else, or they had a major security bug!</p>

<p>Jack emailed HP, but they had no plans to fix the issue, so he had to whip up an alternate method of generating a UUID in the case that the user was on this device. The launch had to be pushed back to accommodate it, but the hole was plugged, and life went on as usual.</p><div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">ProGet</a> can centralize your organization&#39;s software applications and components to provide uniform access to developers and servers. <a href="http://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">Check it out!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=vF2YMOk7BBE:YW8BkYpPkGA:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/vF2YMOk7BBE" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"30";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:66:"https://thedailywtf.com/articles/comments/when-unique-isn-t-unique";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"CodeSOD: Butting In";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:43:"https://thedailywtf.com/articles/butting-in";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 30 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:43:"https://thedailywtf.com/articles/butting-in";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4673:"<p>Initech is a large, international corporation. Any time you&#39;re doing business at a global scale, you&#39;re going to need to contend with a language barrier sooner or later. This makes employees who are multilingual valuable.</p>
<p><strong>Dana</strong> recently joined Initech, and in the first week, was warned about Jerry. Jerry was the &#34;chief&#34; &#34;architect&#34; and team &#34;lead&#34;, and was one of those special, valuable employees who spoke three languages. Correction, &#34;spoke&#34; needs scare quotes too, because Jerry was incomprehensible in every language he spoke, including his native tongue.</p>
<p>Jerry&#39;s emails were stuff of legend around the office. Punctuation was included, not to structure sentences, but as a kind of decoration, just to spice up his communiques. Capitalization was applied at random. Sentences weren&#39;t there to communicate a single thought or idea, but to express fragments of half considered dreams.</p>
<p>Despite being the &#34;chief architect&#34;, Jerry&#39;s code was about as clear as his emails. His class definitions were rambling stretches of unrelated functionality, piled together into a ball of mud. Splattered through it all were blocks of commented out functionality. And 99.9% of his commits to master had syntax errors.</p>
<p>Why did his commits always have syntax errors? Jerry had never seen fit to install a C++ compiler on his machine, and instead pushed to master and let their CI system compile and find all his syntax errors. He&#39;d then amend the commit to fix the errors, and woe betide anyone else working in the repo, because he&#39;d next <code>git push --force</code> the amended commit. Then he&#39;d fix the new round of syntax errors.</p>
<p>Their organization did have an official code review standard, but since no one understood any of Jerry&#39;s code, and Jerry was the &#34;chief&#34;, Jerry reviewed his own code.</p>
<p>So, let&#39;s talk about enumerated types. A common practice in C++ enums is to include an extra value in the enum, just to make it easy to discover the size of the enum, like so:</p>
<pre><code class="language-cplusplus"><div>enum Color {
    COLOR_RED,
    COLOR_BLACK,
    COLOR_BLUE,
    COLOR_SIZE
}
</div></code></pre>
<p><code>COLOR_SIZE</code> isn&#39;t actually a color value, but it tells you how many color values there <em>are</em>. This can be useful when working with a large team, as it&#39;s a sort of form of documentation. It also allows patterns like, `for (int i = 0; i &lt; COLOR_SIZE; i++)…`. Of course, it only works when everyone follows the same convention.</p>
<p>Jerry couldn&#39;t remember the convention. So, in his native language, he invented a new one: he&#39;d end all his enums with a <code>_END</code> instead of <code>_SIZE</code>. But Jerry <em>also</em> couldn&#39;t remember what the English word for &#34;end&#34; was. So he went off to Google Translate, and got an English translation.</p>
<p>Then he wrote code. Lots of code. No one got to review this code. Jerry touched everything, without worrying about what any other developer was doing.</p>
<p>This meant that before long, every enum in the system looked like this:</p>
<pre><code class="language-cplusplus"><div>enum Color {
    COLOR_RED,
    COLOR_BLACK,
    COLOR_BLUE,
    COLOR_BUTT
}
</div></code></pre>
<p>Eventually, Jerry left Initech. He&#39;d found a position where he could be a CTO of a well-funded startup. The very same day, Dana submitted her largest pull request ever, where she removed every single one of Jerry&#39;s butts.</p>
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script><div>
	<img src="https://thedailywtf.com/images/footer/raygun50.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Forget logs. Next time you&#39;re struggling to replicate error, crash and performance issues in your apps - Think <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Raygun</a>! Installs in minutes. <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Learn more.</a>
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=r3e5VRx4UdA:UtNvXHmq-MY:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/r3e5VRx4UdA" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"31";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:52:"https://thedailywtf.com/articles/comments/butting-in";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Mark Bowytz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Error&#039;d: Modern Customer Support";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://thedailywtf.com/articles/modern-customer-support";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"Error'd";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Fri, 27 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:56:"https://thedailywtf.com/articles/modern-customer-support";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2991:"<p>&#34;It&#39;s interesting to consider that First Great Western&#39;s train personnel track on-time but meanwhile, their seats measure uptime,&#34; writes <strong>Roger G.</strong>
</p><blockquote><p><a href="#Pic-1"><img itemprop="image" border="0" alt="" src="//thedailywtf.com/images/19/q3/e382/Pic-1.jpg"/></a></p><p> </p></blockquote>

<p><strong>Peter G.</strong> writes, &#34;At $214.90 for two years I was perfectly happy, but this latest price increase? You&#39;ve simply gone TOO FAR and I will be cancelling ASAP!&#34;
</p><blockquote><p><a href="#Pic-2"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e382/Pic-2.png"/></a></p><p> </p></blockquote>

<p>&#34;SharePoint does a lot of normal things, but in the case of this upgrade, it truly went above and beyond,&#34; <strong>Adam S.</strong> wrote.
</p><blockquote><p><a href="#Pic-3"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e382/Pic-3.png"/></a></p><p> </p></blockquote>

<p>&#34;Sure, I guess you <i>can</i> email a question, but just don&#39;t get your hopes up for a reply,&#34; writes <strong>Samuel N.</strong>
</p><blockquote><p><a href="#Pic-4"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e382/Pic-4.png"/></a></p><p> </p></blockquote>

<p><strong>Al H.</strong> writes, &#34;When I signed up for a trial evaluation of Toad and got an e-mail with the activation license key, this was not quite what I was expecting.&#34;
</p><blockquote><p><a href="#Pic-5"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e382/Pic-5.png"/></a></p><p> </p></blockquote>

<p>&#34;The cover story, in case anybody starts asking too many questions, is that Dustin is the name of the male squirrel outside the window. He and Sylvia the squirrel are married. <u>Nobody</u> was testing in Production,&#34; writes <strong>Sam P.</strong></p><blockquote><p><strong><a href="#Pic-6"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e382/Pic-6.jpg"/></a></strong></p><p><strong> </strong></p></blockquote><div>
	<img src="https://thedailywtf.com/images/inedo/buildmaster-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/BuildMaster?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Confidence&amp;utm_campaign=Buildmaster_Footer">Utilize BuildMaster</a> to release your software with confidence, at the pace your business demands. <a href="https://inedo.com/BuildMaster/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Confidence&amp;utm_campaign=Buildmaster_Footer">Download</a> today!  
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=0cVwukhaHg8:BTyfAYpSurw:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/0cVwukhaHg8" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"22";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:65:"https://thedailywtf.com/articles/comments/modern-customer-support";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"CodeSOD: Trim Off a Few Miles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://thedailywtf.com/articles/trim-off-a-few-miles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 26 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:53:"https://thedailywtf.com/articles/trim-off-a-few-miles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3048:"<p>I don’t know the length of <strong>Russell F</strong>’s commute. Presumably, the distance is measured in miles. Miles and miles. I say that, because of this block, which is written… with <em>care</em>.</p>
<pre><code class="csharp">  string Miles_w_Care = InvItem.MilesGuaranteeFlag == true &amp;&amp; InvItem.Miles_w_Care.HasValue ? (((int)InvItem.Miles_w_Care / 1000).ToString().Length &gt; 2 ? ((int)InvItem.Miles_w_Care / 1000).ToString().Trim().Substring(0, 2) : ((int)InvItem.Miles_w_Care / 1000).ToString().Trim()) : &#34;  &#34;;
  string Miles_wo_Care = InvItem.MilesGuaranteeFlag == true &amp;&amp; InvItem.Miles_wo_Care.HasValue ? (((int)InvItem.Miles_wo_Care / 1000).ToString().Length &gt; 2 ? ((int)InvItem.Miles_wo_Care / 1000).ToString().Trim().Substring(0, 2) : ((int)InvItem.Miles_wo_Care / 1000).ToString().Trim()) : &#34;  &#34;;</code></pre>

<p>Two lines, so many nested ternaries. Need to round off to the nearest thousand? Just divide and then <code>ToString</code> the result, selecting the substring as needed. Be sure to <code>Trim</code> the string which couldn’t possibly contain whitespace, you never know.</p>

<p>Ironically, the only expression in this block which isn’t a WTF is <code>InvItem.MilesGuaranteeFlag == true</code>, because while we’re comparing against <code>true</code>, <code>MilesGuaranteeFlag</code> is a <code>Nullable&lt;bool&gt;</code>, so this confirms that it has a value <em>and</em> that the value is true.</p>

<p>So many miles.</p>

<blockquote>
<p>And I would write five hundred lines<br/>
and I would write five hundred more<br/>
just to be the man who wrote a thousand lines<br/>
<code>Uncaught Exception at line 24</code></p>
</blockquote>
<!-- Easy Reader Version: The tern pun I didn't use for this was "I'll tern this car around and go back home" or "Tern off in five miles" -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">ProGet</a> can centralize your organization&#39;s software applications and components to provide uniform access to developers and servers. <a href="http://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">Check it out!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=0yzijXem1h8:9Q0pLWEgLxQ:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/0yzijXem1h8" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"26";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:62:"https://thedailywtf.com/articles/comments/trim-off-a-few-miles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:2:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";s:4:"href";s:46:"http://syndication.thedailywtf.com/TheDailyWtf";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:2:{s:3:"rel";s:3:"hub";s:4:"href";s:32:"http://pubsubhubbub.appspot.com/";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:4:"info";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:3:"uri";s:11:"thedailywtf";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://www.w3.org/2003/01/geo/wgs84_pos#";a:2:{s:3:"lat";a:1:{i:0;a:5:{s:4:"data";s:8:"41.36995";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"long";a:1:{i:0;a:5:{s:4:"data";s:10:"-81.862591";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:4:"etag";s:27:"M0nDbL7wDkTPYyVcchpTU5XY2BE";s:13:"last-modified";s:29:"Wed, 16 Oct 2019 17:55:19 GMT";s:16:"content-encoding";s:4:"gzip";s:4:"date";s:29:"Wed, 16 Oct 2019 17:57:51 GMT";s:7:"expires";s:29:"Wed, 16 Oct 2019 17:57:51 GMT";s:13:"cache-control";s:18:"private, max-age=0";s:22:"x-content-type-options";s:7:"nosniff";s:16:"x-xss-protection";s:13:"1; mode=block";s:6:"server";s:3:"GSE";}s:5:"build";s:14:"20191015192130";}