// generated by stringer -type=Token; DO NOT EDIT

package token

import "fmt"

const _Token_name = "tok_startEOFErrorWhitespaceCommentStringIntegerDecimalOpenParenCloseParenBoolIdentifier"

var _Token_index = [...]uint8{9, 12, 17, 27, 34, 40, 47, 54, 63, 73, 77, 87}

func (i Token) String() string {
	if i < 0 || i >= Token(len(_Token_index)) {
		return fmt.Sprintf("Token(%d)", i)
	}
	hi := _Token_index[i]
	lo := uint8(0)
	if i > 0 {
		lo = _Token_index[i-1]
	}
	return _Token_name[lo:hi]
}