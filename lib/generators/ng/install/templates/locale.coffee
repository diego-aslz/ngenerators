angular.module "ngLocale", [], ["$provide", ($provide) ->
  PLURAL_CATEGORY =
    ZERO: "zero"
    ONE:  "one"
    TWO: "two"
    FEW: "few"
    MANY: "many"
    OTHER: "other"
  $provide.value "$locale",
    DATETIME_FORMATS:
      AMPMS:
        '0': "AM"
        '1': "PM"
      DAY: [
        "Domingo"
        "Segunda-Feira"
        "Terça-Feira"
        "Quarta-Feira"
        "Quinta-Feira"
        "Sexta-Feira"
        "Sábado"
      ]
      MONTH: [
        "Janeiro"
        "Fevereiro"
        "Março"
        "Abril"
        "Maio"
        "Junho"
        "Julho"
        "Agosto"
        "Setembro"
        "Outubro"
        "Novembro"
        "Dezembro"
      ]
      SHORTDAY: [
        "dom"
        "seg"
        "ter"
        "qua"
        "qui"
        "sex"
        "sáb"
      ]
      SHORTMONTH: [
        "jan"
        "fev"
        "mar"
        "abr"
        "mai"
        "jun"
        "jul"
        "ago"
        "set"
        "out"
        "nov"
        "dez"
      ]
      fullDate: "EEEE, d 'de' MMMM 'de' y"
      longDate: "d 'de' MMMM 'de' y"
      medium: "dd/MM/yyyy HH:mm:ss"
      mediumDate: "dd/MM/yyyy"
      mediumTime: "HH:mm:ss"
      short: "dd/MM/yy HH:mm"
      shortDate: "dd/MM/yy"
      shortTime: "HH:mm"
    NUMBER_FORMATS:
      CURRENCY_SYM: "R$ "
      DECIMAL_SEP: ","
      GROUP_SEP: "."
      PATTERNS:
        "0":
          gSize: 3
          lgSize: 3
          macFrac: 0
          maxFrac: 3
          minFrac: 0
          minInt: 1
          negPre: "-"
          negSuf: ""
          posPre: ""
          posSuf: ""
        "1":
          gSize: 3
          lgSize: 3
          macFrac: 0
          maxFrac: 2
          minFrac: 2
          minInt: 1
          negPre: "(\u00A4"
          negSuf: ")"
          posPre: "\u00A4"
          posSuf: ""
    id: "pt-br"
    pluralCat: (n) ->
      if n == 1 then PLURAL_CATEGORY.ONE else PLURAL_CATEGORY.OTHER
]
