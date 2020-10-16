//словарь слов и переводов
let words = ["hello": ["ru": "Привет", "en":"Hello"],"day": ["ru": "День", "en":"Day", "pt": "Dia"],"terms": ["en": "Terms", "pt":"Termos"]]
//аргументы командной строки
let arguments = CommandLine.arguments 
//если оба ключа есть
if let indexKeyk = arguments.firstIndex(of: "-k"), let indexKeyl = arguments.firstIndex(of: "-l"){
  //если после какого-либо ключа не указано значение
  if indexKeyk + 1 == arguments.endIndex || indexKeyl + 1 == arguments.endIndex{
    print("Not found")
  }else{
    //если есть искомое слово и искомый язык
    if let word = words[arguments[indexKeyk + 1].lowercased()], let language = word[arguments[indexKeyl + 1].lowercased()]{
      print(language)
    }else{
      print("Not found")
    }
  }
//если есть только ключ -k
}else if let indexKeyk = arguments.firstIndex(of: "-k"){
  //если после ключа не указано значение
  if indexKeyk + 1 == arguments.endIndex{
    print("Not found")
  }else{
    //если есть искомое слово
    if let word = words[arguments[indexKeyk + 1].lowercased()]{
      print(arguments[indexKeyk + 1])
      for (language, literal) in word{
        print("\t\(language): \(literal)")    
      }
    }else{
      print("Not found")
    }
  }
//если есть только ключ -l
} else if let indexKeyl = arguments.firstIndex(of: "-l"){
  //если после ключа не указано значение
  if indexKeyl + 1 == arguments.endIndex{
    print("Not found")
  }else{
    //счетчик, чтобы подсчитывать, найден ли хотя бы 1 перевод
    var count = 0
    for (word, translation) in words{
      if let literal = translation[arguments[indexKeyl+1].lowercased()] {
        print("\(word) = \(literal)")
        count+=1
      }
    }
    if count == 0{
      print("Not found")
    }
  }
//если нет аргументов, кроме пути
}else if arguments.count == 1{
  for (word, translation) in words{
    print(word)
    for (language, literal) in translation{
      print("\t\(language): \(literal)")
    }
  }
}