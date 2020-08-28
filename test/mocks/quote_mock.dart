import 'dart:convert';
import 'dart:io';

import 'package:chucknorris_quotes/app/shared/data/models/category.dart';
import 'package:chucknorris_quotes/app/shared/data/models/quote.dart';
import 'package:chucknorris_quotes/app/shared/repositories/quotes/requests/random/random_response.dart';

import 'mock_files.dart';

class QuoteMock {
  static DateTime get fakeDate => DateTime(2020, 01, 05, 13, 42, 28);

  static Quote get singleQuote {
    return Quote(
      categories: [Category(name: 'mock')],
      createdAt: fakeDate,
      iconUrl: 'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
      id: '3eudvPgFQX2dYCuOIUtFpA',
      updatedAt: fakeDate,
      url: 'https://api.chucknorris.io/jokes/3eudvPgFQX2dYCuOIUtFpA',
      value: 'It\'s only a fake quote =)',
    );
  }

  static Quote get singleQuote2 => singleQuote.copyWith(id: 'different');

  static List<Quote> get multipleQuotes => [singleQuote, singleQuote2];

  static Future<List<Quote>> get futureMultipleQuotes async {
    final futures = [
      longValue,
      multipleCategorized,
      noCategorized,
      shortValue,
      singleCategorized,
    ];
    return await Future.wait(futures);
  }

  static Future<Quote> get singleCategorized async {
    final file = File(MockFiles.SingleCategorized.fileName);
    final json = jsonDecode(await file.readAsString());
    final response = QuotesRandomResponse()..fromJson(json);
    return response.quote;
  }

  static Future<Quote> get multipleCategorized async {
    final file = File(MockFiles.SingleMultiCategorized.fileName);
    final json = jsonDecode(await file.readAsString());
    final response = QuotesRandomResponse()..fromJson(json);
    return response.quote;
  }

  static Future<Quote> get noCategorized async {
    final file = File(MockFiles.SingleNoCategorized.fileName);
    final json = jsonDecode(await file.readAsString());
    final response = QuotesRandomResponse()..fromJson(json);
    return response.quote;
  }

  static Future<Quote> get longValue async {
    final file = File(MockFiles.SentenceBiggerThan80.fileName);
    final json = jsonDecode(await file.readAsString());
    final response = QuotesRandomResponse()..fromJson(json);
    return response.quote;
  }

  static Future<Quote> get shortValue async {
    final file = File(MockFiles.SentenceSmallerThan80.fileName);
    final json = jsonDecode(await file.readAsString());
    final response = QuotesRandomResponse()..fromJson(json);
    return response.quote;
  }
}
