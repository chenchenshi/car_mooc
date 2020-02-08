function bold()
%bold()
%使当前图形的曲线及字体变粗
    H=gcf;
    H1=get(H,'Children');
    N=length(H1);
    for i=1:N,
        setline(H1(i))
    end
return
end

%-------------------------
function setline(H)
    aa=get(H,'Type');
    if strcmp(aa,'axes')
        setaxes(H);
    else 
        if strcmp(aa,'line')
            set(H,'LineWidth',3);
            set(H,'MarkerSize',18);
        end
    end
    Hn=get(H,'Children');
    N=length(Hn);
    while N>=1,
        for i=1:N,
            setline(Hn(i));
        end
        return;
    end
end

function setaxes(A)
    set(A,'FontSize',18);
    set(A,'LineWidth',3);
    TI=get(A,'Title');
    set(TI,'FontSize',18);
    set(TI,'LineWidth',3);
    LX=get(A,'Xlabel');
    set(LX,'FontSize',18);
    set(LX,'LineWidth',3);
    LY=get(A,'Ylabel');
    set(LY,'FontSize',18);
    set(LY,'LineWidth',3);
    LZ=get(A,'Zlabel');
    set(LZ,'FontSize',18);
    set(LZ,'LineWidth',3);
end
