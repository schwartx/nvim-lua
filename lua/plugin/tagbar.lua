vim.g.tagbar_type_go = {
	['ctagstype'] = 'go',
  ['kinds'] = {
      'p:package',
      'i:imports:1',
      'c:constants',
      'v:variables',
      't:types',
      'n:interfaces',
      'w:fields',
      'e:embedded',
      'm:methods',
      'r:constructor',
      'f:functions'
  },
  ['sro'] = '.',
  ['kind2scope'] = {
      ['t'] = 'ctype',
      ['n'] = 'ntype'
  },
  ['scope2kind'] = {
      ['ctype'] = 't',
      ['ntype'] = 'n'
  },
  ['ctagsbin']  = 'gotags',
  ['ctagsargs'] = '-sort -silent'
}

vim.g.tagbar_type_json = {
	['ctagstype'] = 'json',
  ['kinds'] = {
    'o:objects',
    'a:arrays',
    'n:numbers',
    's:strings',
    'b:booleans',
    'z:nulls'
  },
  ['sro'] = '.',
  ['kind2scope'] = {
    ['o'] = 'object',
    ['a'] = 'array',
    ['n'] = 'number',
    ['s'] = 'string',
    ['b'] = 'boolean',
    ['z'] = 'null'
  },
  ['scope2kind'] = {
    ['object'] = 'o',
    ['array'] = 'a',
    ['number'] = 'n',
    ['string'] = 's',
    ['boolean'] = 'b',
    ['null'] = 'z'
  },
  ['sort'] = 0
}

vim.g.tagbar_type_yaml = {
	['ctagstype'] = 'yaml',
  ['kinds'] = {
    'a:anchors',
    's:section',
    'e:entry'
  },
  ['sro'] = '.',
  ['kind2scope'] = {
    ['s'] = 'section',
    ['e'] = 'entry'
  },
  ['scope2kind'] = {
    ['section'] = 's',
    ['entry'] = 'e'
  },
  ['sort'] = 0
}
