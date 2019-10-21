CREATE OR REPLACE FUNCTION FN_KO_CHAR (
    i_p1    IN    VARCHAR2
)
    RETURN VARCHAR2
AS
    l_rt    VARCHAR2 (4000);


    FUNCTION f1 (
        i_p1    IN    VARCHAR2
    )
        RETURN VARCHAR2
    AS
        l_p1    PLS_INTEGER     := ASCII (UNISTR (i_p1));
        l_i0    PLS_INTEGER     := l_p1 - TO_NUMBER ('AC00', 'XXXX');
        l_i1    PLS_INTEGER     := TO_NUMBER ('1100', 'XXXX') + FLOOR (l_i0 / (21 * 28));
        l_i2    PLS_INTEGER     := TO_NUMBER ('1161', 'XXXX') + FLOOR (MOD (l_i0, (21 * 28)) / 28);
        l_i3    PLS_INTEGER     := TO_NUMBER ('11A7', 'XXXX') + FLOOR (MOD (l_i0, 28));
        l_rt    VARCHAR2(4000);
    BEGIN
        CASE
            WHEN l_p1 BETWEEN TO_NUMBER ('AC00', 'XXXX') AND TO_NUMBER ('D7A3', 'XXXX')
            THEN
                l_rt := NCHR (l_i1)
                     || CASE WHEN l_i2 <> 4519 THEN NCHR (l_i2) END
                     || CASE WHEN l_i3 <> 4519 THEN NCHR (l_i3) END
                     ;
            ELSE
                l_rt := i_p1;
        END CASE;

        RETURN l_rt;
    END f1;


    FUNCTION f2 (
        i_p1    IN    VARCHAR2
    )
        RETURN VARCHAR2
    AS
        l_p1    VARCHAR2(10);
        l_rt    VARCHAR2(30);
    BEGIN

        FOR i IN 1.. LENGTH( i_p1 )
        LOOP

            l_p1 := SUBSTR(i_p1, i, 1);

            IF l_p1 = 'ㄱ' OR l_p1 = 'ᄀ' THEN l_p1 := 'ㄱ';
            ELSIF l_p1 = 'ㄴ' OR l_p1 = 'ᄂ' THEN l_p1 := 'ㄴ';
            ELSIF l_p1 = 'ㄷ' OR l_p1 = 'ᄃ' THEN l_p1 := 'ㄷ';
            ELSIF l_p1 = 'ㄹ' OR l_p1 = 'ᄅ' THEN l_p1 := 'ㄹ';
            ELSIF l_p1 = 'ㅁ' OR l_p1 = 'ᄆ' THEN l_p1 := 'ㅁ';
            ELSIF l_p1 = 'ㅂ' OR l_p1 = 'ᄇ' THEN l_p1 := 'ㅂ';
            ELSIF l_p1 = 'ㅅ' OR l_p1 = 'ᄉ' THEN l_p1 := 'ㅅ';
            ELSIF l_p1 = 'ㅇ' OR l_p1 = 'ᄋ' THEN l_p1 := 'ㅇ';
            ELSIF l_p1 = 'ㅈ' OR l_p1 = 'ᄌ' THEN l_p1 := 'ㅈ';
            ELSIF l_p1 = 'ㅊ' OR l_p1 = 'ᄎ' THEN l_p1 := 'ㅊ';
            ELSIF l_p1 = 'ㅋ' OR l_p1 = 'ᄏ' THEN l_p1 := 'ㅋ';
            ELSIF l_p1 = 'ㅌ' OR l_p1 = 'ᄐ' THEN l_p1 := 'ㅌ';
            ELSIF l_p1 = 'ㅍ' OR l_p1 = 'ᄑ' THEN l_p1 := 'ㅍ';
            ELSIF l_p1 = 'ㅎ' OR l_p1 = 'ᄒ' THEN l_p1 := 'ㅎ';
            ELSIF l_p1 = 'ㄲ' OR l_p1 = 'ᄁ' THEN l_p1 := 'ㄲ';
            ELSIF l_p1 = 'ᄄ' THEN l_p1 := 'ㄸ';
            ELSIF l_p1 = 'ᄈ' THEN l_p1 := 'ㅃ';
            ELSIF l_p1 = 'ᄊ' OR l_p1 = 'ㅆ' THEN l_p1 := 'ㅆ';
            ELSIF l_p1 = 'ᄍ' THEN l_p1 := 'ㅉ';
            ELSIF l_p1 = 'ㄳ' THEN l_p1 := 'ᄀᄉ';
            ELSIF l_p1 = 'ㄵ' THEN l_p1 := 'ᄂᄌ';
            ELSIF l_p1 = 'ㄶ' THEN l_p1 := 'ᄂᄒ';
            ELSIF l_p1 = 'ㄺ' THEN l_p1 := 'ᄅᄀ';
            ELSIF l_p1 = 'ㄻ' THEN l_p1 := 'ᄅᄆ';
            ELSIF l_p1 = 'ㄼ' THEN l_p1 := 'ᄅᄇ';
            ELSIF l_p1 = 'ㄽ' THEN l_p1 := 'ᄅᄉ';
            ELSIF l_p1 = 'ㄾ' THEN l_p1 := 'ᄅᄐ';
            ELSIF l_p1 = 'ㅀ' THEN l_p1 := 'ᄅᄒ';
            ELSIF l_p1 = 'ㅄ' THEN l_p1 := 'ᄇᄉ';
            ELSIF l_p1 = 'ㅏ' THEN l_p1 := 'ㅏ';
            ELSIF l_p1 = 'ㅑ' THEN l_p1 := 'ㅑ';
            ELSIF l_p1 = 'ㅓ' THEN l_p1 := 'ㅓ';
            ELSIF l_p1 = 'ㅕ' THEN l_p1 := 'ㅕ';
            ELSIF l_p1 = 'ㅗ' THEN l_p1 := 'ㅗ';
            ELSIF l_p1 = 'ㅛ' THEN l_p1 := 'ㅛ';
            ELSIF l_p1 = 'ㅜ' THEN l_p1 := 'ㅜ';
            ELSIF l_p1 = 'ㅠ' THEN l_p1 := 'ㅠ';
            ELSIF l_p1 = 'ㅡ' THEN l_p1 := 'ㅡ';
            ELSIF l_p1 = 'ㅣ' THEN l_p1 := 'ㅣ';
            ELSIF l_p1 = 'ㅐ' THEN l_p1 := 'ㅐ';
            ELSIF l_p1 = 'ㅒ' THEN l_p1 := 'ㅒ';
            ELSIF l_p1 = 'ㅔ' THEN l_p1 := 'ㅔ';
            ELSIF l_p1 = 'ㅖ' THEN l_p1 := 'ㅖ';
            ELSIF l_p1 = 'ㅚ' THEN l_p1 := 'ㅚ';
            ELSIF l_p1 = 'ㅟ' THEN l_p1 := 'ㅟ';
            ELSIF l_p1 = 'ㅢ' THEN l_p1 := 'ㅢ';
            END IF;

            l_rt := l_rt || l_p1;

        END LOOP;

        RETURN l_rt;
    END f2;


BEGIN

    FOR i IN 1..LENGTH( i_p1 )
    LOOP
        l_rt := l_rt || f2( f1( SUBSTR(i_p1, i, 1) ) );
    END LOOP;

    RETURN l_rt;
END FN_KO_CHAR;