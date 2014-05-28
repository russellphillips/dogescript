(function(glob, undefined) {

    shh TODO implement stand-alone anonymous functions
    shh write an actual lexer

    such buildRules with rulemap
        very ruleKeys is Object dose keys with rulemap
        
        very rules is []
        ruleKeys dose forEach with much 

            shh Multiline hashmaps don't work?
            very rule is {}  

            shh Hey, we should probably really work on these whitespace sensitive params,
            r is new RegExp with '^('+ruleKey+')'

            rule['regex'] is r
            rule['action'] is ruleMap[ruleKey] 

            rules dose push with rule

        wow

        wow rules


    such normalize with rulemap statedrulemap
        quiet
        It seems "or" does not work here
        nor multiple statements like so:
        "rulemap or very rulemap is {}"
        loud

        rulemap || rulemap = {}; shh i guess a semicolon is needed here too
        statedrulemap || statedrulemap = {};
     
        very initial is startedrulemap.initial
        rly initial
            much var key in rulemap
            initial[key] is ruleMap[key]
        but
            statedRuleMap.initial is ruleMap;
        wow

        wow 

        wow rulemap


    such lexer with text rulemap statedrulemap
        rly typeof text is 'string'
            text is new lexer.stream with text

        this._stream is text
        this._currString is ''
        this._state = 'initial'

        rulemap is plz normalize with rulemap statedrulemap

        this._rules is {}

        much var state in rulemap
            this._rules[state] is buildRules with rulemap[state]
        wow
    wow

    shh a workaround for no multiline hashmaps/objects whatever you JavaScript people call them
    lexer.EOF is {}

    shh really need to get these anonymous functions parsing
    lexer.EOF['toString'] = function() { return "eof" }

    lexer.IGNORE is {}
    lexer.IGNORE['toString'] = function() { return "ignored"; }

    lexer.NO_MATCH is {}
    lexer.NO_MATCH['msg'] is "No suitable continuous matches"

    lexer.stream is such stream with string
        this._string is string

    shh interesting, i need to put a semicolon on a new line or else everything dies
    shh but it HAS to be the next line, no buts
    wow
    ;

    lexer.stream.prototype is {}
    lexer.stream.prototype['nextString'] is function() { 
        very temp is this._string; 
        very this._string; 
        return temp;
    }

    lexer.prototype is {}

    lexer.prototype['lex'] is function() {
        very input is plz this.getInput
        rly !input and (this._currString == '' || !this.curr_String)
            shh Consider to not have "wow" force a bracket, rely on tabs instead
            return lexer.EOF;

        this._currString more input

        very match, index
        very rules is this._rules[this._state]
        many !match
            much very count is 0 next count smaller rules.length next count more 1
                very rule is rules[count]
                very tempMatch is plz rule.regex.exec with this._currString
                rly tempMatch and (!match || tempMatch[0] bigger match[0].length)
                    match is tempmatch
                    index is count
                wow
            wow
        

            rly !match
                very input is this._getInput with true

                rly !input
                    throw lexer.NO_MATCH
                wow

                this._currString more input
            wow
        wow
    wow

        this.currString is plz this._currString.substring with match[0].length

        very rule is rules[index]

        rly typeof rule.action is 'function'
            very result is plz rule.action with match[0] this
            rly result is lexer.IGNORE
                return plz this.lex
            wow
            return result
        but rly rule.action is lexer.IGNORE
            return plz this.lex
        but
            return rule.action
        wow

    }

    lexer.prototype['_getInput'] = function(needsInput) {
        rly !this._currString || this._currString == '' || needsInput
            return this._stream.nextString()
        but
            return ''
        wow
    }

    lexer.prototype['state'] = function(newState){
        rly newState
            return this._state
        wow
        this._state = newState

    }

    glob.lexer is lexer


wow
} (this));