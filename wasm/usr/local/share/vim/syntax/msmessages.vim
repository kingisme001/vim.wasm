if exists("b:current_syntax")
finish
endif
syn case ignore
syn keyword msmessagesIdentifier MessageIdTypedef
syn keyword msmessagesIdentifier SeverityNames
syn keyword msmessagesIdentifier FacilityNames
syn keyword msmessagesIdentifier LanguageNames
syn keyword msmessagesIdentifier OutputBase
syn keyword msmessagesIdentifier MessageId
syn keyword msmessagesIdentifier Severity
syn keyword msmessagesIdentifier Facility
syn keyword msmessagesIdentifier OutputBase
syn match msmessagesIdentifier /\<SymbolicName\>/ nextgroup=msmessagesIdentEq skipwhite
syn match msmessagesIdentEq transparent /=/ nextgroup=msmessagesIdentDef skipwhite contained
syn match msmessagesIdentDef display /\w\+/ contained
syn case match
syn region msmessagesSet	start="(" end=")" transparent fold contains=msmessagesName keepend
syn match msmessagesName /\w\+/ nextgroup=msmessagesSetEquals skipwhite contained
syn match msmessagesSetEquals /=/ display transparent nextgroup=msmessagesNumVal skipwhite contained
syn match msmessagesNumVal	display transparent "\<\d\|\.\d" contains=msmessagesNumber,msmessagesFloat,msmessagesOctalError,msmessagesOctal nextgroup=msmessagesValSep
syn match msmessagesValSep /:/ display nextgroup=msmessagesNameDef contained
syn match msmessagesNameDef /\w\+/ display contained
syn include @msmessagesC syntax/c.vim
unlet b:current_syntax
syn region msmessagesCComment matchgroup=msmessagesComment start=/;/ end=/$/ contains=@msmessagesC keepend
syn case ignore
syn region msmessagesLangEntry start=/\<Language\>\s*=\s*\S\+\s*$/hs=e+1 end=/^\./ contains=msmessagesFormat,msmessagesLangEntryEnd,msmessagesLanguage keepend
syn match msmessagesLanguage /\<Language\(\s*=\)\@=/ contained
syn match msmessagesLangEntryEnd display /^\./ contained
syn case match
syn match msmessagesFormat display	/%[1-9]\d\?\(![-+0 #]*\d*\(\.\d\+\)\?\(h\|l\|ll\|I\|I32\|I64\)\?[aAcCdeEfgGinopsSuxX]!\)\?/ contained
syn match msmessagesFormat display	/%[0.%\\br]/ contained
syn match msmessagesFormat display	/%!\(\s\)\@=/ contained
syn case ignore
syn match msmessagesNumber	display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match msmessagesNumber	display contained "\<0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match msmessagesOctal	display contained "\<0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=msmessagesOctalZero
syn match msmessagesOctalZero	display contained "\<0"
syn match msmessagesOctalError	display contained "\<0\o*[89]\d*"
syn match msmessagesFloat	display contained "\d\+f"
syn match msmessagesFloat	display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
syn match msmessagesFloat	display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match msmessagesFloat	display contained "\d\+e[-+]\=\d\+[fl]\=\>"
syn match msmessagesFloat	display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
syn match msmessagesFloat	display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
syn case match
syn keyword msmessagesType	int long short char
syn keyword msmessagesType	signed unsigned
syn keyword msmessagesType	size_t ssize_t sig_atomic_t
syn keyword msmessagesType	int8_t int16_t int32_t int64_t
syn keyword msmessagesType	uint8_t uint16_t uint32_t uint64_t
syn keyword msmessagesType	int_least8_t int_least16_t int_least32_t int_least64_t
syn keyword msmessagesType	uint_least8_t uint_least16_t uint_least32_t uint_least64_t
syn keyword msmessagesType	int_fast8_t int_fast16_t int_fast32_t int_fast64_t
syn keyword msmessagesType	uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t
syn keyword msmessagesType	intptr_t uintptr_t
syn keyword msmessagesType	intmax_t uintmax_t
syn keyword msmessagesType	BYTE CHAR SHORT SIZE_T SSIZE_T TBYTE TCHAR UCHAR USHORT
syn keyword msmessagesType	DWORD DWORDLONG DWORD32 DWORD64
syn keyword msmessagesType	INT INT32 INT64 UINT UINT32 UINT64
syn keyword msmessagesType	LONG LONGLONG LONG32 LONG64
syn keyword msmessagesType	ULONG ULONGLONG ULONG32 ULONG64
syn sync match msmessagesLangSync grouphere msmessagesLangEntry "\<Language\s*="
syn sync match msmessagesLangEndSync grouphere NONE "^\."
hi def link msmessagesNumber		Number
hi def link msmessagesOctal		Number
hi def link msmessagesFloat		Float
hi def link msmessagesOctalError	msmessagesError
hi def link msmessagesSetError		msmessagesError
hi def link msmessagesError		Error
hi def link msmessagesLangEntry		String
hi def link msmessagesLangEntryEnd	Special
hi def link msmessagesComment		Comment
hi def link msmessagesFormat		msmessagesSpecial
hi def link msmessagesSpecial		SpecialChar
hi def link msmessagesType		Type
hi def link msmessagesIdentifier	Identifier
hi def link msmessagesLanguage		msmessagesIdentifier
hi def link msmessagesName		msmessagesIdentifier
hi def link msmessagesNameDef		Macro
hi def link msmessagesIdentDef		Macro
hi def link msmessagesValSep		Special
hi def link msmessagesNameErr		Error
let b:current_syntax = "msmessages"
