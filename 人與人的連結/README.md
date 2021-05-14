# 人與人的連結
本程式練習題目的緣由，源自 2021 年 5 月 13 日的事件：例引自聯合新聞網
[陳時中講「人與人的連結」引討論 原來教授老爸著作這樣寫](https://udn.com/news/story/7314/5456145)，

> 陳時中講「人與人的連結」引討論 原來教授老爸著作這樣寫
>
> 新冠肺炎疫情擴大，媒體報導稱中央流行疫情指揮中心指揮官陳時中13日在說明疫情時，稱蘆洲與萬華的案例也找到「人與人連結」的關聯性，「人與人的連結」6字成今天的流行語。法界人士今找出陳時中父親陳棋炎著作的「親屬、繼承法基本問題」一書，書中就提到「人與人之結合」這一語句。法界人士笑說「知道為啥陳時中說出人與人之連結嗎？」、「因為部長的爸爸有教」。
>
> 陳時中的父親陳棋炎是國內早年親屬法權威學者，陳棋炎曾在台灣大學、輔仁大學、文化大學法律系授課。在台大法律系任教數十年，從年輕時擔任助教到後來教授、是國內親屬法權威名師，他所指導過的博士生、碩士生很多也仍在國內民法界有相當地位。當「人與人的連結」成為今天金句時，法界人士翻出當年陳棋炎書中的用語，直說：果然家學淵源。
>
> 陳棋炎在書中有關人類社會之結合關係中寫道：人之所以為萬物之靈長…無非在於「人與人之結合」。陳棋炎並引用德國法律學者Gierke曾說「人之所以為人，在於人與人之結合」。
>
> 法界今天有人PO文貼出陳棋炎早年所撰寫的「親屬、繼承法基本問題」一書，熱議陳時中為何會說出「人與人連結」一詞，還有法學教授討論，家學淵源但同中有異，畢竟，陳棋炎書中內容是談親屬關係，但陳時中談獅子去找的結合，似乎沒有親屬關係。
>
> 「親屬、繼承法基本問題」曾獲教育部1976年度「法科」學術獎得獎著作，被選為台大法學叢書（四），在第一章親屬法基本問題中，陳棋炎指人之所以為萬物之靈長，而能於過去、現在、甚至於將來，發揮其能力者，無非在於「人與人之結合」。

## 演練內容
gen_server person spawns and links to another gen_server person.

## 其餘問題
> Eshell V12.0  (abort with ^G)
> 1> ===> Booted people_links
> person:link_and_link().
> true
> 2> =ALERT REPORT==== 14-May-2021::12:26:26.643533 ===
> {some_gal,<0.151.0>}: No, we have to keep linked. Luv you, {lion_king,
>                                                             <0.150.0>}; you are now <0.152.0>.
>
> 2> whereis(lion_king).
> <0.150.0>
> 3> exit(whereis(lion_king), kill).
> true
> 4> =ERROR REPORT==== 14-May-2021::12:26:52.316130 ===
> ** Generic server some_gal terminating 
> ** Last message in was {'EXIT',<0.150.0>,killed}
> ** When Server state == {state,some_gal,lion_king,<0.150.0>}
> ** Reason for termination ==
> ** killed
>
> =CRASH REPORT==== 14-May-2021::12:26:52.316588 ===
>   crasher:
>     initial call: person:init/1
>     pid: <0.152.0>
>     registered_name: some_gal
>     exception exit: killed
>       in function  gen_server:decode_msg/9 (gen_server.erl, line 485)
>     ancestors: [lion_king,<0.140.0>]
>     message_queue_len: 0
>     messages: []
>     links: []
>     dictionary: []
>     trap_exit: true
>     status: running
>     heap_size: 4185
>     stack_size: 29
>     reductions: 3428
>   neighbours:
>
>
> 4> {whereis(lion_king), whereis(some_gal)}.
> {undefined,undefined}
> 5> 
