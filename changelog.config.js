module.exports = {
  "disableEmoji": false,
  "list": [
    "fix",
    "improvement",
    "feat"
  ],
  "maxMessageLength": 64,
  "minMessageLength": 3,
  "questions": [
    "type",
    "scope",
    "subject",
    "body",
    "breaking",
    "issues",
    "lerna"
  ],
  "scopes": [
    'other',
  ],
  "types": {
    "fix": {
      "description": "A bug fix",
      "emoji": "🐛",
      "value": "fix"
    },
    "improvement": {
      "description": "A improvement",
      "emoji": "💅",
      "value": "improve"
    },
    "feat": {
      "description": "A new feature",
      "emoji": "✨",
      "value": "feat"
    },
  }
};
