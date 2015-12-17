# Code Review
---
## Problem
While working on a team, you are asked to review some code that someone is submitting for your project.  Review the following code and provide feedback on anything that sticks out to you.

## Notes
Remember that code reviews are meant to ensure that code entering into your project reflects the best practices of the project itself.  As a result, you have to be willing to let go of your own biases and look at the bigger picture of the project itself.

That said, the most important things to be looking for here are things that just don't work or things that you think could be implemented differently or better.  This is a very open-ended problem with many potential discussion points.  Start with what's broken first, then focus on what could be improved.

---
## Code

```php
/* ProjectDir/root/app/Animal.php */
namespace Animal;

use Exception;

class Animal
{

    public function __construct($name = "", $owner = "")
    {
        $this->_name = $name;
        $this->_owner = $owner;
    }

    public function getName() {
        return $this->_name;
    }

    public function getAge() {
        return $this->_age;
    }

    public function setOwner($a) {
        $this->_owner = $a;
    }

}

```
