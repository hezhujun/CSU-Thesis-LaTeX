%
% 本模版根据中南大学研究生学位论文撰写规范创建
% 参考：http://oa.its.csu.edu.cn/Home/ReleaseMainText/909CD53BF50943CD97B83C352032FEA4
% 论文内容依次为：
% 1.封面、扉页；
% 2.学位论文原创性声明和版权使用授权书；
% 3.中文摘要；
% 4.英文摘要；
% 5.目录；
% 6.英文缩略词说明（医学类）；
% 7.符号说明（必要时）；
% 8.论文正文；
% 9.参考文献；
% 10.综述（医学类）；
% 11.附录（必要时）；
% 12.攻读博（硕）士学位期间主要研究成果；
% 13.致谢。
% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csuthesis}
              [2021/01/26 v1.0l
CSU Thesis class]
\ProcessOptions\relax

% 基于article
\LoadClass[a4paper]{report}

% 相关宏包 %
%---------------------------------------------------------%
\RequirePackage{ifthen}
% 支持中文的 ctex 宏包
% 设置文档默认字体大小为小四号
\RequirePackage[zihao=-4]{ctex}
%\RequirePackage{xeCJK}
% 设置标题格式
\RequirePackage{titlesec}
% 设置目录
\RequirePackage{titletoc}
% 设置浮动体的标题
\RequirePackage{caption}
\RequirePackage{subcaption}
% 管理参考文献
% 设置参考文献样式为 gb7714-2015
\RequirePackage[style=gb7714-2015, backend=biber]{biblatex}
% 设置页眉和页脚
\RequirePackage{fancyhdr}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
% 超链接
\RequirePackage{hyperref}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{array}
% 长表格
\RequirePackage{longtable}
% multirow 支持在表格中跨行
\RequirePackage{multirow}
% 算法编号
\RequirePackage{algorithm}
% 自定义关键词
%\RequirePackage{pgfkeys}

% \RequirePackage{calc}

% 页面布局 %
%---------------------------------------------------------%

% a4paper大小 297mm*210mm
% 打印区面积 240mm*146mm
% 页眉至顶端距离为1.5 厘米
% 页脚距底端距离为1.75 厘米
\geometry{hcentering, top=1.5cm, bottom=1.75cm, includehead, includefoot}

% 1磅=1/72in，等于0.3527 毫米
% 1pt=1/72.27in
% 1bp=1/72in

% 中文字号表
% 字号 大小（bp） 大小（pt）
% 初号  42  42.15749
% 小初号    36  36.135
% 一号  26  26.09749
% 小一号    24  24.09
% 二号  22  22.08249
% 小二号    18  18.06749
% 三号  16  16.06
% 小三号    15  15.05624
% 四号  14  14.05249
% 小四号    12  12.045
% 五号  10.5    10.53937
% 小五号    9   9.03374
% 六号  7.5 7.52812
% 小六号    6.5 6.52437    
% 七号  5.5 5.52061
% 八号  5   5.01874

% ctex 默认设置的字号和基础行距信息，基础行距是字号的1.2倍
% 初号字体大小 42.15749pt 基础行距 50.58899pt。
% 小初号字体大小 36.135pt 基础行距 43.362pt。
% 一号字体大小 26.09749pt 基础行距 31.31699pt。
% 小一号字体大小 24.09pt 基础行距 28.90799pt。
% 二号字体大小 22.08249pt 基础行距 26.499pt。
% 小二号字体大小 18.06749pt 基础行距 21.68098pt。
% 三号字体大小 16.06pt 基础行距 19.272pt。
% 小三号字体大小 15.05624pt 基础行距 18.06749pt。
% 四号字体大小 14.05249pt 基础行距 16.86299pt。
% 小四号字体大小 12.045pt 基础行距 14.454pt。
% 五号字体大小 10.53937pt 基础行距 12.64725pt。
% 小五号字体大小 9.03374pt 基础行距 10.84048pt。
% 六号字体大小 7.52812pt 基础行距 9.03375pt。
% 小六号字体大小 6.52437pt 基础行距 7.82924pt。
% 七号字体大小 5.52061pt 基础行距 6.62474pt。
% 八号字体大小 5.01874pt 基础行距 6.02249pt。
% ctex使用 \fontsize{⟨size⟩}{⟨base line-skip⟩} 重新设置字体大小和基础行距

% 设置字体
\setmainfont{Times New Roman}  % 设置西文字体
% 重定义ctex定义好的宋体和黑体，以支持伪加粗AutoFakeBold
% 即支持类似word里的给黑体、宋体等中文字体加粗的操作，用\bfseries \textbf{text}
% 可以设置加粗程度，这里设置 AutoFakeBold=1 有一点加粗效果，字体太粗会显得字体变大了
\let\songti\relax
\newCJKfontfamily[song]\songti{SimSun}[AutoFakeBold=1]
\let\heiti\relax
\newCJKfontfamily[hei]\heiti{SimHei}[AutoFakeBold=1]
%\newCJKfontfamily[kai]\kaishu{KaiTi}[AutoFakeBold=1]
% 协议页的标题按模板是华文新魏
\newCJKfontfamily[huawenxinwei]\hwxw{STXinwei}[AutoFakeBold=0]
\setCJKmainfont{SimSun} % 设置中文字体为宋体

% 关于word的行距（单倍行距、固定值）的相关介绍，请看 https://zhuanlan.zhihu.com/p/35869432
% 关于latex的行距介绍，请看 https://zhuanlan.zhihu.com/p/56127244

% 正文是小四号字体，20磅行间距

% 方式一
% \fontsize{12bp}{20bp} % 在正文部分使用有效

% 方式二
%\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{20bp}}
%\normalsize

% 方式三，设用ctex的设置，导入ctex宏包时设置字体大小为小四号
% 需要更新行距为20磅
% 20bp ≈ 20.075pt ≈ 小四号的基础行距14.454pt * 1.389
% 使用 \fontsize 更新字体大小时，最好先重定义\baselinestretch
% 确保更新字体大小后行间距正确
\renewcommand\baselinestretch{1.389}
% 如果单纯更新行间距，只需要使用 \linespread
\linespread{1.389}\selectfont

% 定制titlepage
% 定义命令和定义相应的宏。
%----------------------------------------------------------------------%
% 以下定义封面相关命令和相应的宏，以titleen为例，\titleen为实际在源码中使用的命令，一旦执行就会因为\gdef\@titleen{#1}使得其产生一个\@titleen的宏，而该宏能够在后续的环境中使用。
\DeclareRobustCommand*\titlecn[1]{\gdef\@titlecn{#1}}                   % 中文标题
\def\@titlecn{\@latex@error{No \noexpand\titlecn given}\@ehc}
\newcommand*\titleen[1]{\gdef\@titleen{#1} \gdef\@title{#1}}            % 英文标题

\newcommand*{\priormajor}[1]{\gdef\@priormajor{#1}}                     % 一级学科（学科专业）
\newcommand*{\minormajor}[1]{\gdef\@minormajor{#1}}                     % 二级学科（学科方向）
\newcommand*{\interestmajor}[1]{\gdef\@interestmajor{#1}}               % 研究方向，关键词组
\newcommand*{\department}[1]{\gdef\@department{#1}}                     % 二级培养单位
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}                     % 导师
\newcommand*{\subsupervisor}[1]{\gdef\@subsupervisor{#1}}               % 副导师
\newcommand*{\studentid}[1]{\gdef\@studentid{#1}}                       % 学号

\newcommand*{\clcnumber}[1]{\gdef\@clcnumber{#1}}                       % 中图分类号 Chinese Library Classification
\newcommand*{\schoolcode}[1]{\gdef\@schoolcode{#1}}                     % 学校代码
\newcommand*{\udc}[1]{\gdef\@udc{#1}}                                   % UDC
\newcommand*{\academiccategory}[1]{\gdef\@academiccategory{#1}}         % 学术类别
% 1. 封面、扉页%
%-----------------------------------------------------------------------------------------------------------%

% 封面 %
% -------------------------------------------------------------%
% 学位论文封面格式分为公开学位论文（学术学位）、公开学位论文（专业学位）、涉密学位论文（学术学位）、涉密学位论文（专业学位）等四种形式（具体见样例1-4）。
% 封面正面上填写论文题名、学科专业（一级学科或专业学位类别）、学科方向或专业领域、作者姓名、指导教师姓名等内容。在书脊上方印“博（或硕）士学位论文”，下方印“中南大学”。
% 涉密学位论文须在封面右上角标注密级、定密日期，由校保密办公室审批、盖章。
\newif\ifblindreview\blindreviewfalse
% 以下为公开学位论文（学术）的封面内容
% TODO: 
% - 公开学位论文（专业）
% - 涉密学位论文（学术）
% - 涉密学位论文（专业）

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义 \makecoverpage 实现封面的重新绘制
% -----------------------------------------------%
\newcommand{\makecoverpage} {
	\thispagestyle{empty}
	\begin{center}
		\linespread{1.5}
		\vspace*{1.5cm}
		{\zihao{-2} \bfseries \heiti 硕士学位论文 \par} % 小二号黑体
		\vspace{2\baselineskip} % 两个空行
		{\zihao{2} \bfseries \heiti \@titlecn \par} % 二号黑体
		{\zihao{-2}\bfseries \@titleen \par} % 小二号，timesnewroman
		\vspace{2\baselineskip} % 两个空行
		
		{
			\zihao{3} \songti
			\begin{tabular}{ll}
				\makebox[4em][s]{学科专业} & \@priormajor \\
				\makebox[4em][s]{学科方向} & \@minormajor \\        
				\ifblindreview
				\makebox[4em][s]{研究方向} & \@interestmajor \\
				\makebox[4em][s]{学   号}  & \@studentid \\
				\else
				\makebox[4em][s]{作者姓名} & \@author \\
				\makebox[4em][s]{指导教师} & \@supervisor \\
				\fi
			\end{tabular}
		}
		\par
		\vspace{4cm}
		{\zihao{-3} \songti 中\quad 南\quad 大\quad 学 \par} 
		{\zihao{-3} \songti 2021年4月 \par}
	\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 扉页 
% -----------------------------------------------%
% 公开、涉密学位论文扉页采用统一格式，一律不带密级栏，分为学术学位、专业学位两种格式（具体见样例5-6）。
% 扉页除包含封面正面的全部内容外，还应包括中图分类号、UDC、学校代码、学位类别（专业学位或学术学位）、副题名（必要时）、研究方向、二级培养单位、副指导教师（必要时）、以及论文答辩日期和答辩委员会主席等内容。
% 中图分类号（http://www.ztflh.com/）和UDC号（《国际十进位分类法》）可在图书馆查阅获得

\newcommand{\maketitlepage} {
	\setlength\parindent{0em}
	{
		\zihao{4} \songti
		\begin{tabular}{l@{}c p{3cm} l@{}c}     % @{}去除边框距离，更符合学校模板的下划线紧贴描述文字
			中图分类号  & \underline{\makebox[3cm][c]{\@clcnumber}} & &
			学校代码    & \underline{\makebox[3cm][c]{\@schoolcode}} \\ 
			UDC         & \underline{\makebox[3cm][c]{\@udc}} & &
			学术类别    & \underline{\makebox[3cm][c]{\@academiccategory}} \\ 
		\end{tabular}
	}
	
	{
		\centering
		
		{
			\zihao{-2}
			% 注意centering的使用，只在局部环境中使用。
			\vspace{4ex} % 空行
			{ \bfseries \heiti 博士学位论文 \par} % 小二号黑体
			\vspace{4ex} % 空行
			{ \bfseries \heiti \@titlecn \par} % 中文标题小二号黑体
			{ \bfseries \@titleen \par} % 英文标题小二号 Times New Roman
		}
		
		\vspace{3cm} % 空行
		
		{
			\zihao{3} \songti 
			\setlength\parindent{2em} % 由于这里填写的内容不对称，完全居中反而不够美观，于是缩进一个汉字的宽度
			\begin{tabular}{ll}
				% 利用\makebox[7em][s]{} 实现两端对齐，即字数不同但左右对齐。
				% 7em表示分散对齐的最长的长度为7个字的长度，参数s表示两端分散对齐。
				\makebox[7em][s]{作者姓名：}      &  \@author        \\
				\makebox[7em][s]{学科专业：}      &  \@priormajor    \\
				\makebox[7em][s]{学科方向：}      &  \@minormajor    \\
				\makebox[7em][s]{研究方向：}      &  \@interestmajor \\
				\makebox[7em][s]{二级培养单位：}  &  \@department    \\
				\makebox[7em][s]{指导教师：}      &  \@supervisor    \\
				% \makebox[7em][s]{副指导教师：}    &  \@subsupervisor \\
			\end{tabular}
		}
		
		\vspace{2.5cm}
		
		{
			\zihao{-3} \songti
			\begin{tabular}{l@{}l p{0.5cm} l@{}l}
				论文答辩日期   & \underline{\makebox[3cm][c]{}} & & 
				答辩委员会主席 & \underline{\makebox[3cm][c]{}} \\ 
			\end{tabular}
		}
	}
	\par
	\vspace{2.5cm}
	{
		\linespread{1.5}
		{\centering \zihao{-3} \songti 中\quad 南\quad 大\quad 学 \par} 
		{\centering \zihao{-3} \songti 2021年4月 \par}
	}
	% 中 南 大 学 （小三号宋体）
	% 年    月 （小三号宋体，填阿拉伯数字）
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. 原创性声明和学位论文版权使用授权书 
% -----------------------------------------------%
% 单独设一页，排在扉页后
% 按模板，标题二号，内容四号，这里学校没有特别强调字体字号，
% 应该有一定自由度。

\newcommand{\announcement}{
	% 按学校模板这里是华文新魏字体
	
	{\centering \zihao{2} \hwxw 学位论文原创性声明 \par}
	
	\vspace{0.5cm}
	
	\setlength{\parindent}{2em} % 首行缩进
	{
		\linespread{1.5}
		\zihao{4}
		本人郑重声明，所呈交的学位论文是本人在指导教师指导下进行的研究工作及取得的研究成果。尽我所知，除了论文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得中南大学或其他教育机构的学位或证书而使用过的材料。与我共同工作的同志对本研究所作的贡献均已在论文中作了明确的说明。
		
		申请学位论文与资料若有不实之处，本人承担一切相关责任。
		
		\vspace{0.5cm}
		
		\begin{flushright}
			作者签名：\underline{\makebox[5em][c]{}} ~~
			日期：
			\underline{\makebox[3em][c]{}} 年
			\underline{\makebox[1.5em][c]{}} 月
			\underline{\makebox[1.5em][c]{}} 日
		\end{flushright}
		
	}
	
	\vspace{1cm}
	
	{\centering \zihao{2} \hwxw 学位论文版权使用授权书 \par}
	
	\vspace{0.5cm}
	
	{
		\linespread{1.5}
		\zihao{4} 
		本学位论文作者和指导教师完全了解中南大学有关保留、使用学位论文的规定：即学校有权保留并向国家有关部门或机构送交学位论文的复印件和电子版；本人允许本学位论文被查阅和借阅；学校可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用复印、缩印或其它手段保存和汇编本学位论文。
		
		保密论文待解密后适应本声明。
		
		\vspace{1cm}
		
		\begin{table}[!ht]
			\zihao{4} 
			\begin{tabular*}{\hsize}{@{}@{\extracolsep{\fill}}lll@{}}
				作者签名：\underline{\makebox[5em][c]{}} & &
				指导教师签名：\underline{\makebox[5em][c]{}} \\
				\\
				日期：
				\underline{\makebox[3em][c]{}} 年
				\underline{\makebox[1.5em][c]{}} 月
				\underline{\makebox[1.5em][c]{}} 日 & &
				日期：
				\underline{\makebox[3em][c]{}} 年
				\underline{\makebox[1.5em][c]{}} 月
				\underline{\makebox[1.5em][c]{}} 日 \\
			\end{tabular*}
		\end{table}
	}
}

% 中文摘要 %
%---------------------------------------------------------%

% 中文摘要页（具体见附件1.样例8）上空一行居中打印论文题名（三号黑体加粗，段前18 磅、段后12 磅），换行顶格编排“摘要：”（四号黑体加粗）及摘要内容（四号宋体），每段开头空二格。摘要内容后空一行顶格编排图、表、参考文献的数量（四号宋体）；空两行后顶格编排“关键字：”和“分类号：”（四号黑体加粗），每篇论文应选取3-8 个关键词，每一关键词之间用分号（中文摘要为全角符号，英文摘要为半角符号）分开，最后一个关键词后不打标点符号。20磅行距。
\newenvironment{abstractcn}{
    \clearpage
    \vspace*{\baselineskip} % 空一行
    \vspace{18bp} % 段前18磅
    \begin{center}
        \zihao{3}\heiti\textbf{\@titlecn}
    \end{center}
    \vspace{12bp} % 段后12磅
    \zihao{4}
	% 20bp ≈ 20.075pt ≈ 四号的基础行距16.86299pt * 1.19
	\linespread{1.19}\selectfont
}{}

% 英文摘要格式和内容与中文摘要相对应，另起一页（具体见附件1.样例9）。上空一行居中打印英文题名（三号Times NewRoman 字体加粗），换行顶格编排“Abstract：”（四号Times NewRoman 加粗）及英文摘要内容（四号Times New Roman 字体），摘要内容每段开头留四个字符空格。摘要内容后下空两行，顶格编排“Keywords：”和“Classification：”（四号Times NewRoman 加粗）。20磅行距。
\newenvironment{abstracten}{
    \clearpage
    \vspace*{\baselineskip} % 空一行
    \vspace{18bp} % 段前18磅
    \begin{center}
        \zihao{3}\textbf{\@title}
    \end{center}
    \vspace{12bp} % 段后12磅
    \zihao{4}
	% 20bp ≈ 20.075pt ≈ 四号的基础行距16.86299pt * 1.19
	\linespread{1.19}\selectfont
}{}


% 定义作为标题的格式
% \titleformat{command}[shape]%定义标题类型和标题样式
%               {format}%定义标题格式
%               {label}%定义标题的标签，即标题的标号等
%               {sep}%定义标题和标号之间的水平距离
%               {before-code}%定义标题前的内容
%               [after-code]%定义标题后的内容
% 章名三号黑体加粗，段前18磅，段后12磅，居中
\titleformat{\chapter}{\zihao{3} \centering \heiti \bfseries}{\thechapter}{1em}{}
% 节名四号宋体，段前10磅，段后8磅，顶格编排
\titleformat{\section}{\zihao{4} \songti}{\thesection}{1em}{}
% 小节名小四号宋体，段前10磅，段后8磅，顶格编排
\titleformat{\subsection}{\zihao{-4} \songti}{\thesubsection}{1em}{}

% 定义在目录中的格式
% \titlecontents{标题名}
%               [左间距]
%               {标题格式}
%               {标题标志}
%               {无序号标题}
%               {指引线与页码}
%               [下间距]

% “目录”两字中空两格（三号黑体加粗，段前18 磅，段后12 磅），上空一行，下空一行后为章、节、小节及其开始页码（靠右顶格）。章、节、小节分别以阶梯式排列：1（第1 章）、1.1、1.1.1 依次标出。其中，人文社科类学位论文的章、节、小节等编号排版，可按“第一章”、“第一节”、“一、”、“（一）”的形式撰写，章、节、小节的题名与页码之间用“……”连接。除“目录”两字外，章名采用小四号黑体，其余字体均为小四号宋体。

\renewcommand{\tableofcontents}{%
	\clearpage
	\vspace*{\baselineskip} % 上空一行
	\vspace*{18bp} % 段前18 磅
	\begin{center}
		\zihao{3} \heiti \bfseries 目\hspace*{1.5em}录
	\end{center}
	\vspace*{12bp} % 段后12 磅
	\vspace*{\baselineskip} % 下空一行
	\@starttoc{toc}
}

\titlecontents{chapter}
              [0pt]
              {\heiti}
              {\contentslabel{1em}} % 章名前面的序号所占的宽度
              {\hspace*{-1em}} % 章名前面没有序号，通过设置负宽度去掉序号所占的空间
              {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{section}
              [2em]
              {}
              {\contentslabel{1.8em}}
              {}
              {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsection}
              [4em]
              {}
              {\contentslabel{2.5em}}
              {}
              {\titlerule*[0.5pc]{.}\contentspage}

% 图下方描述的楷体字
\DeclareCaptionFont{kai}{\kaishu}
\DeclareCaptionFont{five}{\zihao{5}}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}

\captionsetup[figure]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={kai,five},   % 图的字体, 宋体小四
	position=bottom    % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
% 表格格式
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\captionsetup[table]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={kai,five},   % 表的字体, 宋体小四
	position=top
}
% 编号分章节
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

% 参考文献格式
% 上空一行居中书写“参考文献”四字(三号黑体加粗，段前18 磅、段后12 磅)，空一行左起按顺序顶格依次列出参考文献
\defbibheading{bibliography}[\bibname]{%
	\clearpage
	\vspace*{\baselineskip}
	\vspace*{18bp}
	\begin{center}
		\zihao{3} \heiti \bfseries 参考文献
		\addcontentsline{toc}{chapter}{参考文献}
	\end{center}
	\vspace*{12bp}
	\vspace*{\baselineskip}
}

% 页眉页脚设置
% 前置部分
\fancypagestyle{frontstyle}{
	\fancyhf{} % 清空页眉页脚的设置
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[C]{\zihao{-5} \thepage} % 页码位于页面底端，居中书写（Times New Roman 小五号）
}

\newcommand{\frontmatter}{
	\pagestyle{frontstyle}
	\pagenumbering{Roman}
}

% 后置部分
\fancypagestyle{mainstyle}{
	\fancyhf{} % 清空页眉页脚的设置
	\renewcommand{\headrulewidth}{0.4pt}
	\fancyhead[L]{\zihao{5} \songti 中南大学硕士学位论文}
	\fancyhead[R]{\zihao{5} \songti \leftmark}
	\fancyfoot[C]{\zihao{-5} \thepage} % 页码位于页面底端，居中书写（Times New Roman 小五号）
}
\newcommand{\mainmatter}{
	\pagestyle{mainstyle}
	\pagenumbering{arabic}
}


\newcommand{\fontinfo}[1]{#1 字体大小\f@size pt \quad 基础行距\f@baselineskip \quad 行距缩放\f@linespread \quad 行距\the\baselineskip}
