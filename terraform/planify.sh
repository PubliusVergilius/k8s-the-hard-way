#!/bin/bash

terraform graph > plan.dot \
&& dot -Tpng > plan.png
