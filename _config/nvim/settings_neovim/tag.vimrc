" Set tags: {{{
	" 각 폴더별 분류에 따른 tags 세팅
	" 'if문의 =~' 의미는 포함 여부
	set tags=./tags
	if getcwd() =~ '/home/office/cc_stg'	" O&T
		set tags+=$TAGS_DIR/tags.BCM			" bcm
		set tags+=$TAGS_DIR/tags.IWA			" iwa
	elseif getcwd() =~ $EQUITY_HOME			" 2016.07.01 - Equity
		set tags+=$TAGS_DIR/tags.EQUITY
		set tags+=$TAGS_DIR/tags.QUANTLIB
		set tags+=$TAGS_DIR/tags.DSDPS
	elseif getcwd() =~ '/home/deplus/arbitrage_crypto' " 2016.07.01 - Equity
		set tags=$TAGS_DIR/tags.ArbitrageBot
	endif

	if getcwd() =~ $IMDB_HOME				" imdb
		set tags+=$TAGS_DIR/tags.IMDBi
		set tags+=$TAGS_DIR/tags.IMDB
	elseif getcwd() =~ $BOS_HOME			"bos
		set tags+=$TAGS_DIR/tags.BOS
	elseif getcwd() =~ $INFOWAY_HOME		"infoway
		set tags+=$TAGS_DIR/tags.INFOWAY
	elseif getcwd() =~ $MFP_HOME			"mfp
		set tags+=$TAGS_DIR/tags.MFP
	elseif getcwd() =~ $WQIS_HOME			"wqis
		set tags+=$TAGS_DIR/tags.WQIS
	elseif getcwd() =~ $ORD_HOME			"ord
		set tags+=$TAGS_DIR/tags.ORDi
		set tags+=$TAGS_DIR/tags.ORD
"		set tags+=$ORD_HOME/lib/tags
	elseif getcwd() =~ $GFX_HOME			"gfx
		set tags+=$TAGS_DIR/src/tag.GFXs
	elseif getcwd() =~ $ALICE_HOME			"alice
		set tags+=$TAGS_DIR/tags.ALICE
	elseif getcwd() =~ $IWA_HOME			" 2016.07.01 - Equity
		set tags-=$TAGS_DIR/tags.BCM		"iwa
		set tags+=$TAGS_DIR/tags.IWA		"iwa
	endif

"set complete
"set tagbsearch
" }}}
