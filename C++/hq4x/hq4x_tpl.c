    const int cond00 = (P(0xbf,0x37) || P(0xdb,0x13)) && WDIFF(w1, w5);
    const int cond01 = (P(0xdb,0x49) || P(0xef,0x6d)) && WDIFF(w7, w3);
    const int cond02 = (P(0x6f,0x2a) || P(0x5b,0x0a) || P(0xbf,0x3a) ||
                        P(0xdf,0x5a) || P(0x9f,0x8a) || P(0xcf,0x8a) ||
                        P(0xef,0x4e) || P(0x3f,0x0e) || P(0xfb,0x5a) ||
                        P(0xbb,0x8a) || P(0x7f,0x5a) || P(0xaf,0x8a) ||
                        P(0xeb,0x8a)) && WDIFF(w3, w1);
    const int cond03 = P(0xdb,0x49) || P(0xef,0x6d);
    const int cond04 = P(0xbf,0x37) || P(0xdb,0x13);
    const int cond05 = P(0x1b,0x03) || P(0x4f,0x43) || P(0x8b,0x83) ||
                       P(0x6b,0x43);
    const int cond06 = P(0x4b,0x09) || P(0x8b,0x89) || P(0x1f,0x19) ||
                       P(0x3b,0x19);
    const int cond07 = P(0x0b,0x08) || P(0xf9,0x68) || P(0xf3,0x62) ||
                       P(0x6d,0x6c) || P(0x67,0x66) || P(0x3d,0x3c) ||
                       P(0x37,0x36) || P(0xf9,0xf8) || P(0xdd,0xdc) ||
                       P(0xf3,0xf2) || P(0xd7,0xd6) || P(0xdd,0x1c) ||
                       P(0xd7,0x16) || P(0x0b,0x02);
    const int cond08 = (P(0x0f,0x0b) || P(0x2b,0x0b) || P(0xfe,0x4a) ||
                        P(0xfe,0x1a)) && WDIFF(w3, w1);
    const int cond09 = P(0x2f,0x2f);
    const int cond10 = P(0x0a,0x00);
    const int cond11 = P(0x0b,0x09);
    const int cond12 = P(0x7e,0x2a) || P(0xef,0xab);
    const int cond13 = P(0xbf,0x8f) || P(0x7e,0x0e);
    const int cond14 = P(0x4f,0x4b) || P(0x9f,0x1b) || P(0x2f,0x0b) ||
                       P(0xbe,0x0a) || P(0xee,0x0a) || P(0x7e,0x0a) ||
                       P(0xeb,0x4b) || P(0x3b,0x1b);
    const int cond15 = P(0x0b,0x03);
    
    if (cond00)
        *dst00 = interp_2px(w4, 5, w3, 3, 3);
    else if (cond01)
        *dst00 = interp_2px(w4, 5, w1, 3, 3);
    else if ((P(0x0b,0x0b) || P(0xfe,0x4a) || P(0xfe,0x1a)) && WDIFF(w3, w1))
        *dst00 = w4;
    else if (cond02)
        *dst00 = interp_2px(w4, 5, w0, 3, 3);
    else if (cond03)
        *dst00 = interp_2px(w4, 3, w3, 1, 2);
    else if (cond04)
        *dst00 = interp_2px(w4, 3, w1, 1, 2);
    else if (cond05)
        *dst00 = interp_2px(w4, 5, w3, 3, 3);
    else if (cond06)
        *dst00 = interp_2px(w4, 5, w1, 3, 3);
    else if (P(0x0f,0x0b) || P(0x5e,0x0a) || P(0x2b,0x0b) || P(0xbe,0x0a) ||
             P(0x7a,0x0a) || P(0xee,0x0a))
        *dst00 = interp_2px(w1, 1, w3, 1, 1);
    else if (cond07)
        *dst00 = interp_2px(w4, 5, w0, 3, 3);
    else
        *dst00 = interp_3px(w4, 2, w1, 1, w3, 1, 2);
    
    if (cond00)
        *dst01 = interp_2px(w4, 7, w3, 1, 3);
    else if (cond08)
        *dst01 = w4;
    else if (cond02)
        *dst01 = interp_2px(w4, 3, w0, 1, 2);
    else if (cond09)
        *dst01 = w4;
    else if (cond10)
        *dst01 = interp_3px(w4, 5, w1, 2, w3, 1, 3);
    else if (P(0x0b,0x08))
        *dst01 = interp_3px(w4, 5, w1, 2, w0, 1, 3);
    else if (cond11)
        *dst01 = interp_2px(w4, 5, w1, 3, 3);
    else if (cond04)
        *dst01 = interp_2px(w1, 3, w4, 1, 2);
    else if (cond12)
        *dst01 = interp_3px(w1, 2, w4, 1, w3, 1, 2);
    else if (cond13)
        *dst01 = interp_2px(w1, 5, w3, 3, 3);
    else if (cond05)
        *dst01 = interp_2px(w4, 7, w3, 1, 3);
    else if (P(0xf3,0x62) || P(0x67,0x66) || P(0x37,0x36) || P(0xf3,0xf2) ||
             P(0xd7,0xd6) || P(0xd7,0x16) || P(0x0b,0x02))
        *dst01 = interp_2px(w4, 3, w0, 1, 2);
    else if (cond14)
        *dst01 = interp_2px(w1, 1, w4, 1, 1);
    else
        *dst01 = interp_2px(w4, 3, w1, 1, 2);
    
    if (cond01)
        *dst10 = interp_2px(w4, 7, w1, 1, 3);
    else if (cond08)
        *dst10 = w4;
    else if (cond02)
        *dst10 = interp_2px(w4, 3, w0, 1, 2);
    else if (cond09)
        *dst10 = w4;
    else if (cond10)
        *dst10 = interp_3px(w4, 5, w3, 2, w1, 1, 3);
    else if (P(0x0b,0x02))
        *dst10 = interp_3px(w4, 5, w3, 2, w0, 1, 3);
    else if (cond15)
        *dst10 = interp_2px(w4, 5, w3, 3, 3);
    else if (cond03)
        *dst10 = interp_2px(w3, 3, w4, 1, 2);
    else if (cond13)
        *dst10 = interp_3px(w3, 2, w4, 1, w1, 1, 2);
    else if (cond12)
        *dst10 = interp_2px(w3, 5, w1, 3, 3);
    else if (cond06)
        *dst10 = interp_2px(w4, 7, w1, 1, 3);
    else if (P(0x0b,0x08) || P(0xf9,0x68) || P(0x6d,0x6c) || P(0x3d,0x3c) ||
             P(0xf9,0xf8) || P(0xdd,0xdc) || P(0xdd,0x1c))
        *dst10 = interp_2px(w4, 3, w0, 1, 2);
    else if (cond14)
        *dst10 = interp_2px(w3, 1, w4, 1, 1);
    else
        *dst10 = interp_2px(w4, 3, w3, 1, 2);
    
    if ((P(0x7f,0x2b) || P(0xef,0xab) || P(0xbf,0x8f) || P(0x7f,0x0f)) &&
         WDIFF(w3, w1))
        *dst11 = w4;
    else if (cond02)
        *dst11 = interp_2px(w4, 7, w0, 1, 3);
    else if (cond15)
        *dst11 = interp_2px(w4, 7, w3, 1, 3);
    else if (cond11)
        *dst11 = interp_2px(w4, 7, w1, 1, 3);
    else if (P(0x0a,0x00) || P(0x7e,0x2a) || P(0xef,0xab) || P(0xbf,0x8f) ||
             P(0x7e,0x0e))
        *dst11 = interp_3px(w4, 6, w3, 1, w1, 1, 3);
    else if (cond07)
        *dst11 = interp_2px(w4, 7, w0, 1, 3);
    else
        *dst11 = w4;
    
