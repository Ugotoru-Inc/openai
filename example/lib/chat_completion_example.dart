import 'package:dart_openai/dart_openai.dart';

import 'env/env.dart';

void main() async {
  // Set the OpenAI API key from the .env file.
  OpenAI.apiKey = Env.apiKey;

  OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
    model: "gpt-3.5-turbo-1106",
    responseFormat: {"type": "json_object"},
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: "return any message you are given as JSON.",
        role: OpenAIChatMessageRole.assistant,
      ),
      OpenAIChatCompletionChoiceMessageModel(
        content: "hello",
        role: OpenAIChatMessageRole.user,
      ),
    ],
  );

  print(chatCompletion.id);
  print(chatCompletion.choices.first.message);
}
