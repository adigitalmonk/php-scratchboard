# Refactoring
---
## Problem
You've been tasked with cleaning up and commenting a function that was created a long time ago for the project you are working on.

Rewrite the code such that:
- PHP will throw no warnings or errors
- The code is thoroughly commented
- The function must still takes in the same parameters and returns the same parameters (to not break existing functionality that uses it)
- There are no logic blocks that are more than one deep
- The code itself is PSR-2 compliant

## Notes
- You can create new functions during this refactoring
- It is safe to assume that the function only takes in an array as parameters
---
## Code

```php
function calculateAveragePoints($obj = false) {
    if (isset($obj)) {
        if (!empty($obj)) {
            if (count($obj)) {
                $sum = 0;
                foreach($obj as $user_data) {
                    if (isset($user_data['points'])) {
                        $sum += $user_data['points'];
                    }
                }
                $total = 0;
                foreach($obj as $user_data) {
                    $total += 1;
                }
            }
        }
    }
    $average = $sum / $total;
    return $average;
}
```
