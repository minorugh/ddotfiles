% shiika.sty (version 1.02) by Shinsaku Fujita 2000/09/10
% shiika.sty (version 1.01) by Shinsaku Fujita 2000/02/12
% shiika.sty (version 1.00) by Shinsaku Fujita 1998/08/30
% Copyright (C) 1998, 2000, 2002 by Shinsaku Fujita, All rights reserved. 
%
%  縦書における「詩歌」環境
%
%  作成者: 藤田眞作
%          fujitas@chem.kit.ac.jp
%
%   藤田眞作著「続LaTeX2e階梯・縦書編」所載
%
%   version 1.02
%   2002/9/10 by Shinsaku Fujita
%   二行目以降の字下げを可変に
%   引数<ハング>を追加．
%
%   version 1.01
%   2000/2/12 by Shinsaku Fujita
%   字下げを可変に
%
%   藤田眞作著「入門・縦横文書術」所載
%
%   無保証
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\def\j@urnalname{shiika}
%\def\versi@ndate{August 30, 1998}
%\def\versi@nno{ver1.00}
%\def\copyrighth@lder{SF} % Shinsaku Fujita
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\def\j@urnalname{shiika}
%\def\versi@ndate{February 12, 2000}
%\def\versi@nno{ver1.01}
%\def\copyrighth@lder{S. Fujita} % Shinsaku Fujita
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\j@urnalname{shiika}
\def\versi@ndate{September 10, 2002}
\def\versi@nno{ver1.02}
\def\copyrighth@lder{S. Fujita} % Shinsaku Fujita
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\typeout{Option Style `\j@urnalname' (\versi@nno) <\versi@ndate>\space 
[\copyrighth@lder]}
\typeout{藤田眞作著「続LaTeX2e階梯・縦書編」所載}
\typeout{藤田眞作著「入門・縦横文書術」所載}
%
% 詩歌環境
% \begin{shiika}[字下げ](字間)<ハング>
%   字下げは詩全体を下げる．デフォルトで2字分
%   (字間がデフォルト四分アキになります)
%   ハングはに二行以降の字下げ．デフォルトは2zw
% \end{shiika}
%
\newif\if@kotobagaki \@kotobagakifalse
\def\shiika{\@ifnextchar[{\@shiika}{\@shiika[2zw]}}
\def\@shiika[#1]{\@ifnextchar({\@shiik@[#1]}{\@shiik@[#1](0.25zw)}}
\def\@shiik@[#1](#2){\@ifnextchar<{\@shiik@@[#1](#2)}{\@shiik@@[#1](#2)<2zw>}}
\def\@shiik@@[#1](#2)<#3>{\begingroup\let\\\@normalcr
   \par%念のため\kanjiskipの影響が及ばないように指定
   \list{}{%
    \kanjiskip=#2 plus 0.01zw minus 0.01zw
    \xkanjiskip=\kanjiskip
    \itemsep=\z@ \topsep=\z@ \parsep=\z@
    \leftmargin=#1\relax
		\@tempdimb=#1%詞書用に保存
%%		\advance\leftmargin by2zw
		\advance\leftmargin by#3
    \dimen0=#3\relax
    \dimen1=1zw\relax
    \@tempcnta=\dimen0\relax
    \@tempcntb=\dimen1\relax
    \divide\@tempcnta by\@tempcntb
%%		\@tempdima=#2 \multiply\@tempdima by2\relax
		\@tempdima=#2 \multiply\@tempdima by\@tempcnta\relax
		\advance\leftmargin by\@tempdima
%%		\itemindent=-2zw
		\itemindent=-#3\relax
    \advance\itemindent by-\@tempdima
    \listparindent=\itemindent
    \rightmargin=0zw}\item\relax\@kotobagakitrue}
\def\endshiika{\par\endgroup\endlist}
%
% 詞書(shiika環境の外側で用いる)
% \kotobagaki{詞書}{作者名}
%   詞書の最終行の末端と作者名の間に空白
%
\def\kotobagaki#1#2{%
{\leftskip 3zw\relax%            %左余白(縦組では上余白)
\rightskip 2zw%                  %右余白(縦組では下余白)
\parfillskip -\rightskip%        %右余白に等しくはみ出しの埋め草
\parindent 1zw\relax%            %段落冒頭の字下げ
\setbox0=\hbox{#2}%              %
\dimen0=\wd0\advance\dimen0 by1zw
\leavevmode%                     %垂直モードから脱出
\null\nobreak\hskip -\leftskip%  %左余白の分を戻ってから、出力開始
{#1}\nobreak\hfill\nobreak%      %#1を出力してから、#2を下寄せ 
\hbox to\dimen0{\hss#2}\par}}
%
% 詞書(shiika環境の内側で用いる)
% \kotobagakI{詞書}{作者名}
%   詞書の最終行の末端と作者名の間に空白
%
\def\kotobagakI#1#2{%shiika環境の内部でのみ使用
\if@kotobagaki\else\item\relax\fi\@kotobagakifalse
{\kanjiskip=0pt plus0.01zw minus0.01zw
\let\xkanjiskip=\kanjiskip
\leftskip=-\leftmargin%          %左余白(縦組では上余白)
\rightskip 2zw%                  %右余白(縦組では下余白)
\parfillskip -\rightskip%        %右余白に等しくはみ出しの埋め草
\parindent 1zw\relax%            %段落冒頭の字下げ
\setbox0=\hbox{#2}%              %
\dimen0=\wd0\advance\dimen0 by1zw
\leavevmode%                     %垂直モードから脱出
\null\nobreak\hskip -\leftskip%  %左余白の分を戻ってから、出力開始
\hskip1zw\hskip-\@tempdimb% shiika環境より受け取り
{#1}\nobreak\hfill\nobreak%      %#1を出力してから、#2を下寄せ 
\hbox to\dimen0{\hss#2}\par}}
%
% 詞書(shiika環境の外側で用いる)
% \dottedkotobagaki{詞書}{作者名}
%   詞書の最終行の末端と作者名の間に点線
%
\def\dottedkotobagaki#1#2{%shiika環境の内部でのみ使用
{\leftskip 3zw\relax%            %左余白(縦組では上余白)
\rightskip 2zw%                  %右余白(縦組では下余白)
\parfillskip -\rightskip%        %右余白に等しくはみ出しの埋め草
\parindent 1zw\relax%            %段落冒頭の字下げ
\setbox0=\hbox{#2}%              %
\dimen0=\wd0\advance\dimen0 by.5zw
\leavevmode%                     %垂直モードから脱出
\null\nobreak\hskip -\leftskip%  %左余白の分を戻ってから、出力開始
{#1}\nobreak%                    %#1を出力
\hskip.5zw\nobreak
\leaders\hbox to.333334zw{\hss\raise.26zh\hbox{.}\hss}\hfill
\nobreak%      
\hbox to\dimen0{\hss#2}\par}}%       %点線出力ののち#2を下寄せ  
%
% 詞書(shiika環境の内側で用いる)
% \dottedkotobagakI{詞書}{作者名}
%   詞書の最終行の末端と作者名の間に点線
%
\def\dottedkotobagakI#1#2{%
\if@kotobagaki\else\item\relax\fi\@kotobagakifalse
{\kanjiskip=0pt plus0.01zw minus0.01zw
\let\xkanjiskip=\kanjiskip
\leftskip=-\leftmargin%          %左余白(縦組では上余白)
\rightskip 2zw%                  %右余白(縦組では下余白)
\parfillskip -\rightskip%        %右余白に等しくはみ出しの埋め草
\parindent 1zw\relax%            %段落冒頭の字下げ
\setbox0=\hbox{#2}%              %
\dimen0=\wd0\advance\dimen0 by.5zw
\leavevmode%                     %垂直モードから脱出
\null\nobreak\hskip -\leftskip%  %左余白の分を戻ってから、出力開始
\hskip1zw\hskip-\@tempdimb% shiika環境より受け取り
{#1}\nobreak%                    %#1を出力
\hskip.5zw\nobreak
\leaders\hbox to.333334zw{\hss\raise.26zh\hbox{.}\hss}\hfill
\nobreak%      
\hbox to\dimen0{\hss#2}\par}}%       %点線出力ののち#2を下寄せ  
%
% 詞書
% \dashkotobagaki{詞書}{作者名}
%   詞書の最終行の末端と作者名の間に棒線
%
\def\dashkotobagaki#1#2{%
{\leftskip 3zw\relax%            %左余白(縦組では上余白)
\rightskip 2zw%                  %右余白(縦組では下余白)
\parfillskip -\rightskip%        %右余白に等しくはみ出しの埋め草
\parindent 1zw\relax%            %段落冒頭の字下げ
\setbox0=\hbox{#2}%              %
\dimen0=\wd0\advance\dimen0 by.5zw
\leavevmode%                     %垂直モードから脱出
\null\nobreak\hskip -\leftskip%  %左余白の分を戻ってから、出力開始
{#1}\nobreak%                    %#1を出力
\hskip.5zw\nobreak
\hrulefill%                       %棒線出力
\nobreak%      
\hbox to\dimen0{\hss#2}\par}}%    %#2を下寄せ  
%
% 詞書(索引項目としても使える)
% \dottedsakuin{詞書}{作者名}
%   詞書の最終行の末端と作者名の間に空白
%   \dottedkotobagakiとはパラメーターが異なる
%
\def\dottedsakuin#1#2{%
{\leftskip 1zw\relax%            %左余白(縦組では上余白)
\rightskip 2zw%                  %右余白(縦組では下余白)
\parfillskip -\rightskip%        %右余白に等しくはみ出しの埋め草
\parindent 0zw\relax%            %段落冒頭の字下げ
\setbox0=\hbox{#2}%              %
\dimen0=\wd0\advance\dimen0 by.25zw
\leavevmode%                     %垂直モードから脱出
\null\nobreak\hskip -\leftskip%  %左余白の分を戻ってから、出力開始
{#1}\nobreak%                    %#1を出力
\hskip.25zw\nobreak
\leaders\hbox to.333334zw{\hss\raise.26zh\hbox{.}\hss}\hfill
\nobreak\hbox to\dimen0{\hss#2}\par}}%点線出力ののち#2を下寄せ  
%
% TeXbookの\signedと空きのパラメーターが違うだけ
%
\def\jsigned#1{{\unskip\nobreak\hfil\penalty50
\hskip2zw\null\nobreak\hfil #1\parfillskip=0pt
\finalhyphendemerits=0 \par}}
%
% 和歌列挙環境
%
% 書式: 
%  \begin{wakarekkyo}[和歌字間](作者字間)<字下げ,字上げ>
%   和歌 & 作者名 \cr
%  \end{wakarekkyo}
%
%
\def\wakarekkyo{\@ifnextchar[%]
 {\@wakarekkyo}{\@wakarekkyo[.25zw]}}
\def\@wakarekkyo[#1]{\@ifnextchar(%)
 {\@w@karekkyo[#1]}{\@w@karekkyo[#1](0.25zw)}}
\def\@w@karekkyo[#1](#2){\@ifnextchar<%>
 {\@w@k@rekkyo[#1](#2)}{\@w@k@rekkyo[#1](#2)<2zw,1zw>}}
\def\@w@k@rekkyo[#1](#2)<#3,#4>{\tabskip=0pt
\def\tempa{#3}\def\tempb{#4}%
\halign to \hsize\bgroup\tabskip=0pt\relax
\ifx\tempa\empty\relax\hskip2zw\else\hskip#3\fi
\hbox{\kanjiskip=#1 plus 0.01zw minus 0.01zw
\let\xkanjiskip=\kanjiskip
##\unskip}\hfil\tabskip=\@centering&\tabskip=0pt
\hbox{\kanjiskip=#2 plus 0.01zw minus 0.01zw
\let\xkanjiskip=\kanjiskip
##\unskip}\hfil\ifx\tempb\empty\hskip1zw\else\hskip#4\fi
\tabskip=0pt\crcr}
\def\end@w@k@rekkyo{\egroup}
\let\end@w@karekkyo=\end@w@k@rekkyo
\let\end@wakarekkyo=\end@w@karekkyo
\let\endwakarekkyo=\end@wakarekkyo
%
% 和歌環境用の詞書
%
\def\kotobagakiRage{1zw}
\def\kotobagakiR#1#2{\noalign{#1\jsigned{#2%
\hspace*{\kotobagakiRage}}}}
%
% 和歌番号環境
%
% 書式: 
%  \begin{wakabango}[和歌字間](作者字間)<字下げ,字上げ>
%   和歌 & 作者名 \cr
%  \end{wakabongo}
%
\newcounter{wakano}
\def\thewakano{\Kanji{wakano}}
\def\wakabango{\@ifnextchar[%]
 {\@wakabango}{\@wakabango[.25zw]}}
\def\@wakabango[#1]{\@ifnextchar(%)
 {\@w@kabango[#1]}{\@w@kabango[#1](0.25zw)}}
\def\@w@kabango[#1](#2){\@ifnextchar<%>
 {\@w@k@bango[#1](#2)}{\@w@k@bango[#1](#2)<2zw,1zw>}}
\def\@w@k@bango[#1](#2)<#3,#4>{\tabskip=0pt
\def\tempa{#3}\def\tempb{#4}%
\halign to\hsize\bgroup\tabskip=0pt\relax
\refstepcounter{wakano}%
%\ifx\tempa\empty\relax\hskip2zw\else\hskip#3\fi
\ifx\tempa\empty\relax\@tempdima=2zw\else\@tempdima=#3\fi
\hskip\@tempdima
\hbox to0pt{\hss\hbox to\@tempdima{%
 \scriptsize\rensuji{\arabic{wakano}}\hss}}%
{\hbox{\kanjiskip=#1 plus 0.01zw minus 0.01zw
\let\xkanjiskip=\kanjiskip
##\unskip}\hfil}\tabskip=\@centering&\tabskip=0pt
{\hbox{\kanjiskip=#2 plus 0.01zw minus 0.01zw
\let\xkanjiskip=\kanjiskip
##\unskip}\hfil}\ifx\tempb\empty\hskip1zw\else\hskip#4\fi
\tabskip=0pt\crcr}
\def\end@w@k@bango{\egroup}
\let\end@w@kabango=\end@w@k@bango
\let\end@wakabango=\end@w@kabango
\let\endwakabango=\end@wakabango
\endinput
