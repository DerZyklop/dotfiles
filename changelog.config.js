module.exports = {
  "disableEmoji": false,
  "list": [
    "fix",
    "improve",
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
    'config',
    'other',
  ],
  "types": {
    "fix": {
      "description": "A bug fix",
      "emoji": "🐛",
      "value": "fix"
    },
    "improve": {
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
