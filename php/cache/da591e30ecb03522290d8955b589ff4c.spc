a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"The Daily WTF";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:23:"http://thedailywtf.com/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:45:"Curious Perversions in Information Technology";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 18 Sep 2019 19:17:13 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"CodeSOD: You Can Take Care";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"https://thedailywtf.com/articles/you-can-take-care";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 18 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:50:"https://thedailywtf.com/articles/you-can-take-care";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3711:"<p><strong>Tiberrias</strong> sends us some code that, on its face, without any context, doesn’t look bad.</p>
<pre><code class="csharp">var conditionId = _monitorConditionManagement.GetActiveConditionCountByClient(clientIdentityNumber);

_monitorConditionManagement.StopCondition(conditionId);</code></pre>

<p>The purpose of this code is to lookup a condition ID for a client, and then clear that condition from a client by <code>StopCondition</code>ing that ID. Which, if you read the code closely, the problem becomes obvious: <code>GetActiveConditionCountByClient</code>. <strong>Count</strong>. This doesn’t return a condition ID, it returns the count of the number of active conditions. So, this is a stupid, simple mistake, an easy error to make, and an easy error to catch- this code simply doesn’t work, so what’s the WTF?</p>

<p>This code was written by a developer who either made a simple mistake or just didn’t care. But then it went through code review- and the code reviewer either missed it, or just didn’t care. It’s okay, though, because there are unit tests. There’s a rich, robust unit test suite. But in this case, the <code>GetActiveConditionCountByClient</code> and the <code>StopCondition</code> methods are just mocks, and the person who wrote the unit test didn’t check to see that the mocks were called as expected, because they just didn’t care.</p>

<p>Still, there’s an entire QA team between this code and production, and since this code <em>definitely can’t work</em>, they’re going to catch the bug, right? They might- if they cared. But this code passed QA, and got released into production.</p>

<p>The users might notice, but the <code>StopCondition</code> method is so nice that, if given an invalid ID, it just logs the error and trucks on. The users think their action worked. But hey, there’s a log file, right? There’s an operations team which monitors the logs and should notice a lot of errors suddenly appearing. They just would have to <em>care</em>, which guess what…</p>

<p>This bug only got discovered and fixed because Tiberrias noticed it while scrolling through the class to fix an entirely unrelated bug.</p>

<p>“You really shouldn’t fix two unrelated bugs in the same commit,” the code reviewer said when Tiberrias submitted it.</p>

<p>There was only one way to reply. “I don’t care.”</p>
<!-- Easy Reader Version: I've used this easy reader version before, but: https://www.youtube.com/watch?v=xhaPvmqqIS0 -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">ProGet</a> supports your applications, Docker containers, and third-party packages, allowing you to enforce quality standards across all components. <a href="https://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">Download</a> and see how!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=_zRYiToH7Lc:8ja6bfzcu-g:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/_zRYiToH7Lc" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"16";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:59:"https://thedailywtf.com/articles/comments/you-can-take-care";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Charles Robinson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"A Learning Experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://thedailywtf.com/articles/a-learning-experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:16:"Feature Articles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 17 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:54:"https://thedailywtf.com/articles/a-learning-experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4534:"<p><b>Jakob M.</b> had the great pleasure of working as a System Administrator in a German school district. At times it was rewarding work. Most of the time it involved replacing keyboard keys mischievous children stole and scraping gum off of monitor screens. It wasn&#39;t always the students that gave him trouble though. 
</p><p>
Frau Fritzenberger was a cranky old math teacher at a Hauptschule near Frankfurt. Jakob regularly had to answer support calls she made for completely frivolous things. Having been teaching since before computers were a thing, she put up a fight for every new technology or program Jakob&#39;s department wanted to implement. 
</p><p>
Over the previous summer, a web-based grading system called NotenWertung was rolled out across the district&#39;s network. It would allow teachers to grade homework and post the scores online. They could work from anywhere, with any computer. There was even a limited mobile application. Students and parents could then get a notification and see them instantly. Frau Fritzenberger was predictably not impressed.
</p><p>
She threw a fit on the first day of school and Jakob was dispatched to defuse it. &#34;Why do we need computers for grading?!&#34; she screeched at Jakob. &#34;<i>Paper</i> works just fine like it has for decades! How else can I use blood red pen to shame them for everything they get wrong!&#34; 
</p><p>
&#34;I understand your concern, Frau Fritzenberger,&#34; Jakob replied while making a &#39;calm down&#39; gesture with his arms. &#34;But we can&#39;t have you submitting grades on paper when the <i>entire</i> rest of the district is using NotenWertung.&#34; He had her sit down at the computer and gave her a <i>For Dummies</i>-type walkthrough. &#34;There, it&#39;s easier than you think. You can even do this at night from the comfort of your own home,&#34; he assured her before getting up to leave.
</p><p>
Just as he was exiting the classroom, he heard her shout, &#34;If you were my student, I would smack you with my ruler!&#34; Jakob brushed it off and left to answer a call about paper clips jammed in a PC fan.   
</p><p>
The next morning, Jakob got a rare direct call on his desk phone. It was Frau and she was in a rage. All he could make out between strings of aged German cuss words was &#34;computer is broken!&#34; He hung up and prepared to head to Frau&#39;s Hauptschule. 
</p><p>
Jakob expected to find that Frau didn&#39;t have a network connection, misplaced the shortcut to her browser, didn&#39;t realize the monitor was off, or something stupid like that. What he found was Frau&#39;s computer was <i>literally</i> broken. The LCD screen of her monitor was an elaborate spider web, her keyboard was cracked in half, and the PC tower looked like it had been run over on the Autobahn. Bits of the motherboard dangled outside the case, and the HDD swung from its cable. &#34;Frau Fritzenberger... what in the name of God happened here?!&#34;
</p><p>
&#34;I told you the computer was broken!&#34; Frau shouted while meanly pointing her crooked index finger at Jakob. &#34;You told me I have to do grades on the computer. So I packed it up to take home on my scooter. It was too heavy for me to ride with it on back so I wiped out and it smashed all over the road! This is all <i>your</i> fault!&#34;
</p><p>
Jakob stared on in disbelief at the mangled hunks of metal and plastic. Apparently you can teach an old teacher new tricks but you can&#39;t teach her that the same web application can be accessed from any computer.  
</p><div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">ProGet</a> supports your applications, Docker containers, and third-party packages, allowing you to enforce quality standards across all components. <a href="https://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">Download</a> and see how!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=h0dISNvKeTQ:hB1ftS1J0Lk:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/h0dISNvKeTQ" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"46";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:63:"https://thedailywtf.com/articles/comments/a-learning-experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"CodeSOD: Should I Do this? Depends.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://thedailywtf.com/articles/should-i-do-this-depends";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 16 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:57:"https://thedailywtf.com/articles/should-i-do-this-depends";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3643:"<p>One of the key differences between a true WTF and an ugly hack is a degree of self-awareness. It&#39;s not a WTF if you <em>know</em> it&#39;s a WTF. If you&#39;ve been doing this job for a non-zero amount of time, you have had a moment where you have a solution, and you <em>know</em> it&#39;s wrong, you <em>know</em> you shouldn&#39;t do this, but by the gods, it works and you&#39;ve got more important stuff to worry about right now, so you just <em>do it</em>.</p>
<p>An anonymous submitter committed a sin, and has reached out to us for absolution.</p>
<p>This is a case of &#34;DevOps&#34; hackery. They have one server with no Internet- one <em>remote</em> server with no Internet. Deploying software to a server you can&#39;t access physically <em>or</em> through the Internet is a <em>challenge</em>. They have a solution involving hopping through some other servers and bridging the network that lets them get the <code>.deb</code> package files within reach of the destination server.</p>
<p>But that introduces a new problem: these packages have complex dependency chains and unless they&#39;re installed in the right order, it won&#39;t work. The <em>correct</em> solution would be to install a local package repository on the destination server, and let <code>apt</code> worry about resolving those dependencies.</p>
<p>And in the long run, that&#39;s what our anonymous submitter promises to do. But they found themselves in a situation where they had more important things to worry about, and just needed to <em>do it</em>.</p>
<pre><code class="language-bash"><div><span class="hljs-meta">#!/bin/bash
</span>
count=0
<span class="hljs-keyword">for</span> f <span class="hljs-keyword">in</span> ./*.deb
<span class="hljs-keyword">do</span>
	<span class="hljs-built_in">echo</span> <span class="hljs-string">&#34;Attempt <span class="hljs-variable">$count</span>&#34;</span>

	<span class="hljs-keyword">for</span> file <span class="hljs-keyword">in</span> ./*.deb
	<span class="hljs-keyword">do</span>
	  <span class="hljs-built_in">echo</span> <span class="hljs-string">&#34;Installing <span class="hljs-variable">$file</span>&#34;</span>	
	  sudo dpkg -i <span class="hljs-variable">$file</span>
	<span class="hljs-keyword">done</span>

	(( count++ ))
<span class="hljs-keyword">done</span>
</div></code></pre>
<p>This is a solution to dependency management which operates on <code>O(N^2)</code>: we install each package once for the total number of packages in the folder. It&#39;s the brutest of force solutions, and no matter what our dependency chain looks like, by sheer process of elimination, this <em>will</em> eventually get every package installed. Eventually.</p>
<!-- Easy Reader Version: If it's stupid and it works, commit it to the repo and let your successor worry about it -->
    <div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Ensure your software is built only once and then deployed consistently across environments, by packaging your applications and components. <a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Consistently&amp;utm_campaign=ProGet_Footer">Learn how</a> today!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=BCMDCXQqKkk:BPnbA9c1puY:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/BCMDCXQqKkk" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"29";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:66:"https://thedailywtf.com/articles/comments/should-i-do-this-depends";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Mark Bowytz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Error&#039;d: Many Languages, One WTF";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://thedailywtf.com/articles/many-languages-one-wtf";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"Error'd";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Fri, 13 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:55:"https://thedailywtf.com/articles/many-languages-one-wtf";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2806:"<p>&#34;It&#39;s as if IntelliJ IDEA just gave up trying to parse my code,&#34; writes <strong>John F.</strong>
</p><p><strong>Henry D.</strong> writes, &#34;If you have a phone in English but have it configured to recognize two different languages, simple requests sometimes morph into the weirdest things.&#34;
</p><blockquote><p><a href="#Pic-5"><img itemprop="image" border="0" alt="" src="//thedailywtf.com/images/19/q3/e380/Pic-5.png"/></a></p><p> </p></blockquote>

<p></p><blockquote><p><a href="#Pic-1"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e380/Pic-1.png"/></a></p><p> </p></blockquote>

<p><strong>Carl C.</strong> wrote, &#34;Maybe Best Buy&#39;s page is referring to a store near <a href="https://goo.gl/maps/SjNyEtSrML9qMtnc9">Nulltown, Indiana</a>, but really, I think their site is on drugs.&#34;
</p><blockquote><p><a href="#Pic-2"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e380/Pic-2.png"/></a></p><p> </p></blockquote>

<p>&#34;Yeah, Thanks Cisco, but I&#39;m not sure I really want to learn more,&#34; writes <strong>Matt P.</strong>
</p><blockquote><p><a href="#Pic-3"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e380/Pic-3.jpg"/></a></p><p> </p></blockquote>

<p>&#34;Ebay is alerting me to something. No idea what it is, but I can tell you what they named their variables,&#34; <strong>Lincoln K.</strong> wrote.
</p><blockquote><p><a href="#Pic-4"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e380/Pic-4.jpg"/></a></p><p> </p></blockquote>

<p>&#34;Not quite sure what secrets the Inner Circle holds, I guess knowing Latin?&#34; writes <strong>Matt S.</strong>
</p><blockquote><p><a href="#Pic-6"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e380/Pic-6.jpg"/></a></p><p> </p></blockquote>
<div>
	<img src="https://thedailywtf.com/images/inedo/buildmaster-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/BuildMaster?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Self_Service&amp;utm_campaign=Buildmaster_Footer">BuildMaster</a> allows you to create a self-service release management platform that allows different teams to manage their applications. <a href="https://inedo.com/BuildMaster/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Self_Service&amp;utm_campaign=Buildmaster_Footer">Explore how!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=Ws824hsa5Ps:Pf6BZvYHnAc:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/Ws824hsa5Ps" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:64:"https://thedailywtf.com/articles/comments/many-languages-one-wtf";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"CodeSOD: Time to Wait";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://thedailywtf.com/articles/time-to-wait";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 12 Sep 2019 07:00:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:45:"https://thedailywtf.com/articles/time-to-wait";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4070:"<p>When dealing with customers- and here, we mean, “off the street” customers- they often want to know “how long am I going to have to wait?” Whether we’re talking about a restaurant, a mechanic, a doctor’s office, or a computer/phone repair shop, knowing (and sharing with our customers) reasonable expectations about how much time they’re about to spend waiting.</p>

<p><strong>Russell F</strong> works on an application which facilitates this sort of customer-facing management. It does much more, too, obviously, but one of its lesser features is to estimate how long a customer is about to spend waiting.</p>

<p>This is how that’s calculated:</p>
<pre><code class="csharp">TimeSpan tsDifference = dtWorkTime - DateTime.Now;
string strEstWaitHM = ((tsDifference.Hours * 60) + tsDifference.Minutes).ToString();
if (Convert.ToInt32(strEstWaitHM) &gt;= 60)
{
	decimal decWrkH = Math.Floor(Convert.ToDecimal(strEstWaitHM) / 60);
	int intH = Convert.ToInt32(decWrkH);
	txtEstWaitHours.Value = Convert.ToString(intH);
	int intM = Convert.ToInt32(strEstWaitHM) - (60 * intH);
	txtEstWaitMinutes.Value = Convert.ToString(intM);
}
else
{
	txtEstWaitHours.Value = &#34;&#34;;
	txtEstWaitMinutes.Value = strEstWaitHM;
}</code></pre>

<p>Hungarian Notation is always a great sign of bad code. It really is, and I think that’s because it’s easy to do, easy to enforce as a standard, and provides the most benefit when you have messy variable scoping and keeping track of what type a given variable is might actually be a challenge.</p>

<p><em>Or</em>, as we see in this case, it’s useful when you’re passing the same data through a method with different types. We calculate the difference between the <code>WorkTime</code> and <code>Now</code>. That’s the last thing in this code which makes sense.</p>

<p>The key goal here is that, if we’re going to be waiting for more than an hour, we want to display both the hours and minutes, but if it’s just minutes, we want to display just that. </p>

<p>We have that <code>TimeSpan</code> object, which as you can see, has a convenient <code>Hours</code> and <code>Minutes</code> property. Instead of using that, though, we convert the hours to minutes, add it together, if the number is more than 60, we know we’ll be waiting for over an hour, so we want to populate the hours box, <em>and</em> the minutes box, so we have to convert back to hours and minutes.</p>

<p>In that context, the fact that we have to convert from strings to numbers and back almost seems logical. Almost. I especially like that they <code>Convert.ToDecimal</code> (to avoid rounding errors) and <code>Math.floor</code> the result (to round off). If only there were some numeric type that never rounded off, and always had an integer value. If only…</p>
<!-- Easy Reader Version: I posted this late to keep you waiting -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">ProGet</a> supports your applications, Docker containers, and third-party packages, allowing you to enforce quality standards across all components. <a href="https://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">Download</a> and see how!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=IRZ104jR-dY:TK2rW2h-VBw:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/IRZ104jR-dY" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"34";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:54:"https://thedailywtf.com/articles/comments/time-to-wait";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"CodeSOD: ImAlNumb?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://thedailywtf.com/articles/imalnumb";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 11 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:41:"https://thedailywtf.com/articles/imalnumb";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5066:"<p>I think it’s fair to say that C, as a language, has never had a particularly <em>great</em> story for working with text. Individual characters are <em>okay</em>, but strings are a nightmare. The need to support unicode has only made that story a little more fraught, especially as older code now suddenly needs to support extended characters. And by “older” I mean, “<code>wchar</code> was added in 1995, which is practically yesterday in C time”.</p>

<p><strong>Lexie</strong> inherited some older code. It was not designed to support unicode, which is certainly <em>a</em> problem in 2019, and it’s the problem Lexie was tasked with fixing. But it had an… <em>interesting</em> approach to deciding if a character was alphanumeric.</p>

<p>Now, if we limit ourselves to ASCII, there are a variety of ways we could do this check. We could convert it to a number and do a simple check- characters 48–57 are numeric, 65–90 and 97–122 cover the alphabetic characters. <!-- Am I losing my mind? I could have sworn that range was contiguous, but every ASCII table I check disagrees. It's been decades since I've had to think about this, but I could have sworn… --> But that’s a conditional expression- <em>six</em> comparison operations! So maybe we should be more clever. There is a built-in library function, <code>isalnum</code>, which <em>might</em> be more optimized, and <em>is</em> available on Lexie’s platform. But we’re dedicated to really doing some serious premature optimization, so there has to be a better way.</p>
<pre><code class="c">bool isalnumCache[256] =
{false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true, false, false, false, false, false, false,
false,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true, false, false, false, false, false,
false,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true,  true, true, false, false, false, false,
false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,
false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};</code></pre>

<p>This is a lookup table. Convert your character to an integer, and then use it to index the array. This <em>is</em> fast. It’s also error prone, and this block <em>does</em> incorrectly identify a non-alphanumeric as an alphanumeric. It also 100% fails if you are dealing with <code>wchar_t</code>, which is how Lexie ended up looking at this block in the first place.</p>
<!-- Easy Reader Version: It's actually not *terrible*, but a weird artifact to stumble across -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

<div>
	<img src="https://thedailywtf.com/images/inedo/buildmaster-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/BuildMaster?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Confidence&amp;utm_campaign=Buildmaster_Footer">Utilize BuildMaster</a> to release your software with confidence, at the pace your business demands. <a href="https://inedo.com/BuildMaster/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Confidence&amp;utm_campaign=Buildmaster_Footer">Download</a> today!  
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=3_9qWjsxNro:A_JqF-JMvds:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/3_9qWjsxNro" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"41";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:50:"https://thedailywtf.com/articles/comments/imalnumb";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Jane Bailey";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Death by Consumption";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://thedailywtf.com/articles/death-by-consumption";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:16:"Feature Articles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 10 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:53:"https://thedailywtf.com/articles/death-by-consumption";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4163:"<p style="float:right; padding-left:10px; padding-bottom:10px;"><a title="Roberto Novaes [CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0)], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Tryton_Party_Module_Address_Database_Diagram.png"><img itemprop="image" width="300" alt="Tryton Party Module Address Database Diagram" src="https://upload.wikimedia.org/wikipedia/commons/f/f0/Tryton_Party_Module_Address_Database_Diagram.png"/></a></p>

<p>The task was simple: change an AMQ consumer to insert data into a new Oracle database instead of an old MS-SQL database. It sounded like the perfect task for the new intern, <b>Rodger</b>; Rodger was fresh out of a boot camp and ready for the real world, if he could only get a little experience under his belt. The kid was bright as they came, but boot camp only does so much, after all.</p>

<p>But there are always complications. The existing service was installed on the old app servers that weren&#39;t setup to work with the new corporate app deployment tool. The fix? To uninstall the service on the old app servers and install it on the new ones. Okay, simple enough, if not well suited to the intern.</p>

<p>Rodger got permissions to set up the service on his local machine so he could test his install scripts, and a senior engineer got an uninstall script working as well, so they could seamlessly switch over to the new machines. They flipped the service; deployment day came, and everything went smoothly. The business kicked off their process, the consumer service picked up their message and inserted data correctly to the new database.</p>

<p>The next week, the business kicked off their process again. After the weekend, the owners of the old database realized that the data was inserted into the old database and not the new database. They promptly asked how this had happened. Rodger and his senior engineer friend checked the queue; it correctly had two consumers set up, pointing at the new database. Just to be sure, they also checked the old servers to make sure the service was correctly uninstalled and removed by tech services. All clear.</p>

<p>Hours later, the senior engineer refreshed the queue monitor and saw the queue now had three consumers despite the new setup having only two servers. But how? They checked all three servers—two new and one old—and found no sign of a rogue process.</p>

<p>By that point, Rodger was online for his shift, so the senior engineer headed over to talk to him. &#34;Say, Rodger, any chance one of your installs duplicated itself or inserted itself twice into the consumer list?&#34;</p>

<p>&#34;No way!&#34; Rodger replied. &#34;Here, look, you can see my script, I&#39;ll run it again locally to show you.&#34;</p>

<p>Running it locally ... with dawning horror, the senior engineer realized what had happened. Roger had the install script, but not the uninstall—meaning he had a copy still running on his local developer laptop, connected to the production queue, but with the old config for some reason. Every time he turned on his computer, hey presto, the service started up.</p>

<p>The moral of the story: always give the intern the <i>destructive</i> task, not the constructive one. That can&#39;t go wrong, right?</p><div>
	<img src="https://thedailywtf.com/images/footer/raygun50.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Forget logs. Next time you&#39;re struggling to replicate error, crash and performance issues in your apps - Think <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Raygun</a>! Installs in minutes. <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Learn more.</a>
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=wCUVFcydJ5c:SWEUXChnIsk:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/wCUVFcydJ5c" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"14";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:62:"https://thedailywtf.com/articles/comments/death-by-consumption";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"CodeSOD: Making a Nest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://thedailywtf.com/articles/making-a-nest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 09 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:46:"https://thedailywtf.com/articles/making-a-nest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3858:"<p>Tiffany started the code review with an apology. &#34;I only did this to stay in style with the existing code, because it&#39;s either that or we rewrite the whole thing from scratch.&#34;</p>
<p><strong>Jim J</strong>, who was running the code review nodded. Before Tiffany, this application had been designed from the ground up by Armando. Armando had gone to a tech conference, and learned about F#, and how all those exciting functional features were available in C#, and returned jabbering about &#34;immutable data&#34; and &#34;functors&#34; and &#34;metaprogramming&#34; and decided that he was now a functional programmer, who just <em>happened</em> to work in C#.</p>
<p>Some struggling object-oriented developers use dictionaries for everything. As a struggling functional programmer, Armando used tuples for everything. And these tuples would get deeply nested. Sometimes, you needed to flatten them back out.</p>
<p>Tiffany had contributed this method to do that:</p>
<pre><code class="language-csharp"><div><span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> Result&lt;Tuple&lt;T1, T2, T3, T4, T5&gt;&gt; FlatternTupleResult&lt;T1, T2, T3, T4, T5&gt;(
          Result&lt;Tuple&lt;Tuple&lt;Tuple&lt;Tuple&lt;T1, T2&gt;, T3&gt;, T4&gt;, T5&gt;&gt; tuple
          )
{
    <span class="hljs-keyword">return</span> tuple.Map(x =&gt; <span class="hljs-keyword">new</span> Tuple&lt;T1, T2, T3, T4, T5&gt;(x.Item1.Item1.Item1.Item1, x.Item1.Item1.Item1.Item2, x.Item1.Item1.Item2, x.Item1.Item2, x.Item2));
}
</div></code></pre>
<p>It&#39;s safe to say that deeply nested generics are a <em>super clear</em> code smell, and <em>this</em> line: <code>Result&lt;Tuple&lt;Tuple&lt;Tuple&lt;Tuple&lt;T1, T2&gt;, T3&gt;, T4&gt;, T5&gt;&gt; tuple</code> downright reeks. Tuples in tuples in tuples.</p>
<p>Tiffany cringed at the code she had written, but this method lived in the <code>TaskResultHelper</code> class, and lived alongside methods with these signatures:</p>
<pre><code class="language-csharp"><div><span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> Result&lt;Tuple&lt;T1, T2, T3, T4&gt;&gt; FlatternTupleResult&lt;T1, T2, T3, T4&gt;(Result&lt;Tuple&lt;Tuple&lt;Tuple&lt;T1, T2&gt;, T3&gt;, T4&gt;&gt; tuple)
<span class="hljs-keyword">public</span> <span class="hljs-keyword">static</span> Result&lt;Tuple&lt;T1, T2, T3&gt;&gt; FlatternTupleResult&lt;T1, T2, T3&gt;(Result&lt;Tuple&lt;Tuple&lt;T1, T2&gt;, T3&gt;&gt; tuple)
</div></code></pre>
<p>&#34;This does fit in with the way the application currently works,&#34; Jim admitted. &#34;I&#39;m sorry.&#34;</p>
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script><div>
	<img src="https://thedailywtf.com/images/inedo/buildmaster-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/BuildMaster?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Self_Service&amp;utm_campaign=Buildmaster_Footer">BuildMaster</a> allows you to create a self-service release management platform that allows different teams to manage their applications. <a href="https://inedo.com/BuildMaster/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Self_Service&amp;utm_campaign=Buildmaster_Footer">Explore how!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=RbG2WkN-aRc:IwDgtrDLkrc:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/RbG2WkN-aRc" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"31";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:55:"https://thedailywtf.com/articles/comments/making-a-nest";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Mark Bowytz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Error&#039;d: Does Your Child Say &quot;WTF&quot; at Home?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://thedailywtf.com/articles/does-your-child-say-wtf-at-home";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"Error'd";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Fri, 06 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:64:"https://thedailywtf.com/articles/does-your-child-say-wtf-at-home";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2538:"<p><strong>Abby</strong> wrote, &#34;I&#39;m tempted to tell the school that my child mostly speaks Sanskrit.&#34;
</p><blockquote><p><a href="#Pic-2"><img itemprop="image" border="0" alt="" src="//thedailywtf.com/images/19/q3/e379/Pic-2.png"/></a></p><p> </p></blockquote>

<p>&#34;First of all, I have 58,199 rewards points, so I&#39;m a little bit past joining, second, I&#39;m pretty sure Bing Rewards was rebranded as Microsoft Rewards a while ago, and third...SERPBubbleXL...<i>wat?</i>&#34; writes <strong>Zander</strong>. 
</p><blockquote><p><a href="#Pic-1"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e379/Pic-1.png"/></a></p><p> </p></blockquote>

<p>&#34;I guess, for T-Mobile, time really is money,&#34; <strong>Greg</strong> writes.
</p><blockquote><p><a href="#Pic-3"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e379/Pic-3.png"/></a></p><p> </p></blockquote>

<p><strong>Hans K.</strong> wrote, &#34;I guess it&#39;s sort of fitting, but in a quiz about Generics in Java, I was left a little bit confused.
</p><blockquote><p><a href="#Pic-4"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e379/Pic-4.png"/></a></p><p> </p></blockquote>

<p>&#34;Wait, so if I do, um, nothing, am I allowed to make further changes or any new appointment?&#34; <strong>Jeff K.</strong> writes.
</p><blockquote><p><a href="#Pic-5"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e379/Pic-5.png"/></a></p><p> </p></blockquote>

<p><strong>Soumya</strong> wrote, &#34;Yeah...I&#39;m not a big fan of Starbucks&#39; reward program...&#34;
</p><blockquote><p><a href="#Pic-6"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e379/Pic-6.png"/></a></p><p> </p></blockquote><div>
	<img src="https://thedailywtf.com/images/inedo/otter-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Continuously monitor your servers for configuration changes, and report when there&#39;s configuration drift. <a href="https://inedo.com/otter/download?utm_source=tdwtf&amp;utm_medium=Footerad&amp;utm_term=2018&amp;utm_content=Monitor&amp;utm_campaign=Otter_Footer">Get started with Otter</a> today!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=Dw6eakxgCbw:fJKDWdG2HwU:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/Dw6eakxgCbw" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"34";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:73:"https://thedailywtf.com/articles/comments/does-your-child-say-wtf-at-home";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"CodeSOD: Give Your Date a Workout";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://thedailywtf.com/articles/give-your-date-a-workout";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 05 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:57:"https://thedailywtf.com/articles/give-your-date-a-workout";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3373:"<p><strong>Bob E</strong> inherited a site which helps amateur sports clubs plan their recurring workouts/practices during the season. To do this, given the start date of the season, and the number of weeks, it needs to figure out all of the days in that range.</p>
<pre><code class="php">function GenWorkoutDates()
{

   global $SeasonStartDate, $WorkoutDate, $WeeksInSeason;

   $TempDate = explode(&#34;/&#34;, $SeasonStartDate);

   for ($i = 1; $i &lt;= $WeeksInSeason; $i++)
   {
     for ($j = 1; $j &lt;= 7; $j++)
     {

	   $MonthName = substr(&#34;JanFebMarAprMayJunJulAugSepOctNovDec&#34;, $TempDate[0] * 3 - 3, 3);

       $WorkoutDate[$i][$j] = $MonthName . &#34; &#34; . $TempDate[1] . &#34;  &#34;;
       $TempDate[1] += 1;


       switch ( $TempDate[0] )
	   {
     case 9:
	   case 4:
	   case 6:
	   case 11:
	     $DaysInMonth = 30;
	     break;

	   case 2:
     	 $DaysInMonth = 28;

	     switch ( $TempDate[2] )
	     {
	     case 2012:
	     case 2016:
	     case 2020:
	     	$DaysInMonth = 29;
	        break;

	     default:
	       $DaysInMonth = 28;
	       break;
	     }

	     break;

	   default:
	     $DaysInMonth = 31;
	     break;
	   }

	   if ($TempDate[1] &gt; $DaysInMonth)
	   {
	     $TempDate[1] = 1;
	     $TempDate[0] += 1;
	     if ($TempDate[0] &gt; 12)
	     {
	       $TempDate[0] = 1;
	       $TempDate[2] += 1;
	     }
	   }
     }
   }
}</code></pre>

<p>I do enjoy that PHP’s string-splitting function is called <code>explode</code>. That’s not a WTF. More functions should be called <code>explode</code>.</p>

<p>This method of figuring out the month name, though: </p>

<p><code>$MonthName = substr(&#34;JanFebMarAprMayJunJulAugSepOctNovDec&#34;, $TempDate[0] * 3 - 3, 3);</code></p>

<p>I want to hate it, but I’m impressed with it.</p>

<p>From there, we have lovely hard-coded leap years, the “Thirty days has September…” poem implemented as a switch statement, and then that lovely rollover calculation for the end of a month (and the end of the year).</p>

<p>“I’m not a PHP developer,” Bob writes. “But I know how to use Google.” After some googling, he replaced this block of code with a 6-line version that uses built-in date handling functions.</p>
<!-- Easy Reader Version: Date mangling, entry #4751. Supplies are running low. We might not survive the winter. -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/otter-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Continuously monitor your servers for configuration changes, and report when there&#39;s configuration drift. <a href="https://inedo.com/otter/download?utm_source=tdwtf&amp;utm_medium=Footerad&amp;utm_term=2018&amp;utm_content=Monitor&amp;utm_campaign=Otter_Footer">Get started with Otter</a> today!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=nt5AZ3kwnrw:pBSXDj589PI:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/nt5AZ3kwnrw" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"41";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:66:"https://thedailywtf.com/articles/comments/give-your-date-a-workout";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"CodeSOD: UnINTentional Errors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://thedailywtf.com/articles/unintentional-errors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Wed, 04 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:53:"https://thedailywtf.com/articles/unintentional-errors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3479:"<p>Data type conversions are one of those areas where we have rich, well-supported, well-documented features built into most languages. Thus, we also have endless attempts for people to re-implement them. Or worse, wrap a built-in method in a way which makes everything less clear.</p>

<p><strong>Mindy</strong> encountered this.</p>
<pre><code class="java">/* For converting (KEY_MSG_INPUT) to int format. */
public static int numberToIntFormat(String value) {
  int returnValue = -1;    	
  if (!StringUtil.isNullOrEmpty(value)) {
    try {
      int temp = Integer.parseInt(value);
      if (temp &gt; 0) {
        returnValue = temp;
      }
    } catch (NumberFormatException e) {}
  }    	
  return returnValue;
}</code></pre>

<p>The <code>isNullOrEmpty</code> check is arguably pointless, here. <em>Any</em> invalid input string, including null or empty ones, would cause <code>parseInt</code> to throw a <code>NumberFormatException</code>, which we’re already catching. Of course, we’re catching and <em>ignoring it</em>.</p>

<p>That’s <em>assuming</em> that <code>StringUtil.isNullOrEmpty</code> does what we think it does, since while there are third party Java libraries that offer that functionality, it’s not a built-in class (and do we really think the culprit here was using libraries?). Who knows what it actually does.</p>

<p>And, another useful highlight: note how we check <code>if (temp &gt; 0)</code>? Well, this is a problem. Not only does the downstream code handle negative numbers, –1 is a perfectly <em>reasonable</em> value, which means when this method takes <code>-10</code> and returns <code>-1</code>, what it’s actually done is passed incorrect but valid data back up the chain. And since any errors were swallowed, no one knows if this was intentional or not.</p>

<p>This method wasn’t called in any context relating to <code>KEY_MSG_INPUT</code>, but it was called <em>everywhere</em>, as it’s one of those utility methods that finds new uses any time someone wants to convert a string into a number. Due to its use in pretty much every module, fixing this is considered a &#34;high risk&#34; change, and has been scheduled for sometime in the 2020s.</p>
<!-- Easy Reader Version: There's no task so simple it can't be done wrong. -->
<link rel="stylesheet" href="//thedailywtf.com/images/highlight/styles/github.css"/>
<script src="//thedailywtf.com/images/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">ProGet</a> can centralize your organization&#39;s software applications and components to provide uniform access to developers and servers. <a href="http://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">Check it out!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=ptwP0GhZQ8U:8MAnncT8Vuw:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/ptwP0GhZQ8U" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"27";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:62:"https://thedailywtf.com/articles/comments/unintentional-errors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"CodeSOD: Boxing with the InTern";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://thedailywtf.com/articles/boxing-with-the-intern";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Tue, 03 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:55:"https://thedailywtf.com/articles/boxing-with-the-intern";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5485:"<p>A few years ago, <strong>Naomi</strong> did an internship with Initech. Before her first day, she was very clear on what her responsibilities would be: she&#39;d be on a team modernizing an older product called &#34;Gem&#34; (no relation to Ruby libraries).</p>
<p>By the time her first day rolled around, however, Initech had new priorities. There were a collection of fires on some hyperspecific internal enterprise tool, and everyone was running around and screaming about the apocalypse while dealing with that. Except Naomi, because nobody had any time to bring the intern up to speed on this disaster. Instead, she was given a new priority: just <em>maintain</em> Gem. And no, she wouldn&#39;t have a mentor. For the next six months, Naomi <em>was</em> the Gem support team.</p>
<p>&#34;Start by looking at the code quality metrics,&#34; was the advice she was given.</p>
<p>It was bad advice. First, while Initech had installed an automated code review tool in their source control system, they weren&#39;t <em>using</em> the tool. It had started crashing instead of outputting a report six years ago. Nobody had noticed, or perhaps nobody had cared. Or maybe they just didn&#39;t like getting bad news, because once Naomi had the tool running again, the report was full of bad news.</p>
<p>A huge mass of the code was reimplemented copies of the standard library, &#34;tuned for performance&#34;, which meant instead of a sensible implementation it was a pile of 4,000 line functions wrapping around massive switch statements. The linter didn&#39;t catch that they were parsing XML using regular expressions, but Naomi spotted that and wisely decided not to touch that bit.</p>
<p>What she did find, and fix, was this pattern:</p>
<pre><code class="language-java"><div><span class="hljs-keyword">private</span> Boolean isSided;
<span class="hljs-comment">// dozens more properties</span>
<span class="hljs-function"><span class="hljs-keyword">public</span> <span class="hljs-title">GemGeometryEntryPoint</span><span class="hljs-params">(GemGeometryEntryPoint gemGeometryEntryPoint)</span> </span>{
    <span class="hljs-keyword">this</span>.isSided = gemGeometryEntryPoint.isSided == <span class="hljs-keyword">null</span> ? <span class="hljs-keyword">null</span> : <span class="hljs-keyword">new</span> Boolean(gemGeometryEntryPoint.isSided);
    <span class="hljs-comment">// and so on, for those dozens of properties</span>
}
</div></code></pre>
<p>Java has <em>two</em> boolean types. The <code>Boolean</code> <em>reference</em> type, and <code>boolean</code> primitive type. The <code>boolean</code> is not a full-fledged object, and thus is smaller in memory and faster to allocate. The <code>Boolean</code> is a full class implementation, with all the overhead contained within. A Java developer will generally need to use both, as if you want a <em>list</em> of boolean values, you need to &#34;box&#34; any primitives into <code>Boolean</code> objects.</p>
<p>I say <em>generally</em> need both, because Naomi&#39;s predecessors decided that worrying about boxing was complicated, so they <em>only</em> used the reference types. There wasn&#39;t a <code>boolean</code> or an <code>int</code> to be found, just <code>Boolean</code>s and <code>Integer</code>s. Maybe they just thought &#34;primitive&#34; meant &#34;legacy&#34;?</p>
<p>You can&#39;t convert a <code>null</code> into a boxed type, so <code>new Boolean(null)</code> would throw an exception. Thus, the ternary check in the code above. At no point did anyone think that &#34;hey, we&#39;re doing a null check on pretty much every variable access&#34; mean that there was something wrong in the code.</p>
<p>The bright side to this whole thing was that the unit tests were exemplary. A few hours with <code>sed</code> meant that Naomi was able to switch most everything to primitive types, confirm that she hadn&#39;t introduced any regressions in the process, and even demonstrated that using primitives greatly improved performance, as it cut down on heap memory allocations. The downside was replacing all those ternaries with lines like <code>this.isSided = other.gemGeometryEntryPoint.isSided</code> didn&#39;t look nearly as impressive.</p>
<p>Of course, changing that many lines of code in a single commit triggered some alarms, which precipitated a mini-crisis as no one knew what to do when the intern submitted a 15,000 line commit.</p>
<p>Naomi adds: &#34;Mabye null was supposed to represent <code>FILE_NOT_FOUND</code>?&#34;</p>
<!-- Easy Reader Version: It was Overtern The Box or Boxing with the InTern -->
<div>
	<img src="https://thedailywtf.com/images/footer/raygun50.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Forget logs. Next time you&#39;re struggling to replicate error, crash and performance issues in your apps - Think <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Raygun</a>! Installs in minutes. <a href="https://raygun.com/landing?utm_source=tdwtf&amp;utm_medium=sponsored&amp;utm_campaign=text-link">Learn more.</a>
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=a_PZc7QwlXk:EuDlFgxgh3M:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/a_PZc7QwlXk" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"30";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:64:"https://thedailywtf.com/articles/comments/boxing-with-the-intern";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Alex Papadimoulis";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Classic WTF: Hyperlink 2.0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://thedailywtf.com/articles/classic-wtf-hyperlink-2-0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:16:"Feature Articles";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Mon, 02 Sep 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:58:"https://thedailywtf.com/articles/classic-wtf-hyperlink-2-0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3320:"<blockquote>It&#39;s Labor Day in the US, where we celebrate the workers of the world by having a barbecue. Speaking of work, in these days of web frameworks and miles of unnecessary JavaScript to do basic things on the web, let&#39;s look back at a simpler time, where we still used server-side code and miles of unnecessary JavaScript to do basic things on the web. <a href="//thedailywtf.com/articles/Hyperlink_2_0x2e_0">Original</a>. --<strong>Remy</strong></blockquote>

<p>For those of you who haven&#39;t upgraded to Web 2.0 yet, today&#39;s submission from <b>Daniel</b> is a perfect example of what you&#39;re missing out on. Since the beginning of the Web (the &#34;1.0 days&#34;), website owners have always wanted to know who was visiting their website, how often, and when. Back then, this was accomplished by recording each website &#34;hit&#34; in a log file and running a report on the log later. 
</p><p>But the problem with this method in Web 2.0 is that people don&#39;t use <i>logs</i> anymore; they use <i>blogs</i>, and everyone knows that blogs are a pretty stupid way of tracking web traffic. Fortunately, Daniel&#39;s colleagues developed an elegant, clever, and -- most importantly -- &#34;AJAX&#34; way of solving this problem. Instead of being coded in HTML pages, all hyperlinks are assigned a numeric identifier and kept in a database table. This identifier is then used on the HTML pages within an anchor tag: 
</p><blockquote>
<p></p><pre>&lt;a href=&#34;Javascript: followLink(124);&#34;&gt;View Products&lt;/a&gt;</pre></blockquote>
<p>When the user clicks on the hyperlink, the followLink() Javascript function is executed and the following occur: 
</p><ul style="list-style: disc">
<li>a translucent layer (DIV) is placed over the entire page, causing it to appear &#34;grayed out&#34;, and ... 
</li><li>a &#34;please wait&#34; layer is placed on top of that, with an animated pendulum swinging back and forth, then ... 
</li><li>the XmlHttpRequest object is used to call the &#34;GetHyperlink&#34; web service which, in turn ... 
</li><li>opens a connection to the database server to ... 
</li><li>log the request in the RequestedHyperlinks table and ... 
</li><li>retrieves the URL from the Hyperlinks table, then ... 
</li><li>returns it to the client script, which then ... 
</li><li>sets the window.location property to the URL retrieved, which causes ... 
</li><li>the user to be redirected to the appropriate page </li></ul>
<p>Now <i>that&#39;s</i> two-point-ohey.</p><div>
	<img src="https://thedailywtf.com/images/inedo/otter-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	Continuously monitor your servers for configuration changes, and report when there&#39;s configuration drift. <a href="https://inedo.com/otter/download?utm_source=tdwtf&amp;utm_medium=Footerad&amp;utm_term=2018&amp;utm_content=Monitor&amp;utm_campaign=Otter_Footer">Get started with Otter</a> today!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=yysB0rHIvpw:aIbX3sJxXQg:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/yysB0rHIvpw" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"11";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:67:"https://thedailywtf.com/articles/comments/classic-wtf-hyperlink-2-0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Mark Bowytz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Error&#039;d: Resistant to Change";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://thedailywtf.com/articles/resistant-to-change";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"Error'd";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Fri, 30 Aug 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:52:"https://thedailywtf.com/articles/resistant-to-change";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2751:"<p><strong>Tom H.</strong> writes, &#34;They got rid of their old, outdated fax machine, but updating their website? Yeah, that might take a while.&#34;
</p><blockquote><p><a href="#Pic-4"><img itemprop="image" border="0" alt="" src="//thedailywtf.com/images/19/q3/e378/Pic-4.png"/></a></p><p> </p></blockquote>

<p>&#34;In casinos, they say the house always wins. In this case, when I wanted to cash in my winnings, I gambled and lost against Windows 7 Professional,&#34; <strong>Michelle M.</strong> wrote.
</p><blockquote><p><a href="#Pic-1"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e378/Pic-1.jpg"/></a></p><p> </p></blockquote>

<p><strong>Martin</strong> writes, &#34;Wow! It&#39;s great to see Apple is going the extra mile by protecting my own privacy from myself!&#34;
</p><blockquote><p><a href="#Pic-2"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e378/Pic-2.jpg"/></a></p><p> </p></blockquote>

<p>&#34;Yes, Amazon Photos, with my mouse clicks, I will fix you,&#34; wrote <strong>Amos B.</strong>
</p><blockquote><p><a href="#Pic-3"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e378/Pic-3.png"/></a></p><p> </p></blockquote>

<p>&#34;When searches go wrong at AliExpress they want you to know these three things,&#34; <strong>Erwan R.</strong> wrote.
</p><blockquote><p><a href="#Pic-5"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e378/Pic-5.png"/></a></p><p> </p></blockquote>

<p><strong>Chris A.</strong> writes, &#34;It&#39;s like Authy is saying &#39;I have no idea what you just did, but, on the bright side, there weren`t any errors!&#39;&#34;
</p><blockquote><p><a href="#Pic-6"><img border="0" alt="" src="//thedailywtf.com/images/19/q3/e378/Pic-6.png"/></a></p><p> </p></blockquote>
<div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">ProGet</a> can centralize your organization&#39;s software applications and components to provide uniform access to developers and servers. <a href="http://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Centralize&amp;utm_campaign=ProGet_Footer">Check it out!</a> 
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=WD9DCSEw6EE:1EKxb0bHTno:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/WD9DCSEw6EE" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"11";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:61:"https://thedailywtf.com/articles/comments/resistant-to-change";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Remy Porter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:0:"";a:6:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"CodeSOD: Bassackwards Compatibility";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://thedailywtf.com/articles/bassackwards-compatibility";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"CodeSOD";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:29:"Thu, 29 Aug 2019 06:30:00 GMT";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:59:"https://thedailywtf.com/articles/bassackwards-compatibility";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1834:"<p>A long time ago, you built a web service. It was long enough ago that you chose XML as your serialization format. It worked fine, but before long, customers started saying that they’d really like to use JSON, so now you need to expose a slightly different, JSON-powered version of your API. To make it easy, you release a JSON client developers can drop into their front-ends.</p>

<p><strong>Conor</strong> is one of those developers, and while examining the requests the client sent, he discovered a unique way of making your XML web-service JSON-friendly.</p>

<p><code>{&#34;fetch&#34;:&#34;&lt;fetch version=&#39;1.0&#39;&gt;&lt;entity&gt;&lt;entityDescriptor id=&#39;10&#39;/&gt;…&lt;loadsMoreXML/&gt;&lt;/entity&gt;&lt;/fetch&gt;&#34;}</code></p>

<p>Simplicity itself!</p>
<!-- Easy Reader Version: What, XML is text, isn't it? --><div>
	<img src="https://thedailywtf.com/images/inedo/proget-icon.png" style="display:block; float: left; margin: 0 10px 10px 0;"/> [Advertisement] 
	<a href="https://inedo.com/proget?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">ProGet</a> supports your applications, Docker containers, and third-party packages, allowing you to enforce quality standards across all components. <a href="https://inedo.com/proget/download?utm_source=tdwtf&amp;utm_medium=footerad&amp;utm_term=2018&amp;utm_content=Docker&amp;utm_campaign=ProGet_Footer">Download</a> and see how!
</div>
<div style="clear: left;"> </div><div class="feedflare">
<a href="http://syndication.thedailywtf.com/~ff/TheDailyWtf?a=J0UyBLfNftY:sqBuR9WHxCQ:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/TheDailyWtf?d=yIl2AUoC8zA" border="0"></img></a>
</div><img src="http://feeds.feedburner.com/~r/TheDailyWtf/~4/J0UyBLfNftY" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"21";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:7:"comment";a:1:{i:0;a:5:{s:4:"data";s:68:"https://thedailywtf.com/articles/comments/bassackwards-compatibility";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:2:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";s:4:"href";s:46:"http://syndication.thedailywtf.com/TheDailyWtf";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:2:{s:3:"rel";s:3:"hub";s:4:"href";s:32:"http://pubsubhubbub.appspot.com/";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:4:"info";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:3:"uri";s:11:"thedailywtf";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://www.w3.org/2003/01/geo/wgs84_pos#";a:2:{s:3:"lat";a:1:{i:0;a:5:{s:4:"data";s:8:"41.36995";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"long";a:1:{i:0;a:5:{s:4:"data";s:10:"-81.862591";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:4:"etag";s:27:"oGFC1yAVV09PiJRvNG3ZtZvlWOU";s:13:"last-modified";s:29:"Wed, 18 Sep 2019 19:17:51 GMT";s:16:"content-encoding";s:4:"gzip";s:4:"date";s:29:"Wed, 18 Sep 2019 19:18:40 GMT";s:7:"expires";s:29:"Wed, 18 Sep 2019 19:18:40 GMT";s:13:"cache-control";s:18:"private, max-age=0";s:22:"x-content-type-options";s:7:"nosniff";s:16:"x-xss-protection";s:13:"1; mode=block";s:6:"server";s:3:"GSE";}s:5:"build";s:14:"20190202031713";}