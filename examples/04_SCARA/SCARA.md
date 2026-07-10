SCARA (Selective Compliance Articulated Robotic Arm) is a 4 axis industrial robotic arm.

The arm is flexible in the horizontal XY-plane but rigid in the vertical Z direction. This makes it very useful for jobs such as inserting pegs into holes.

The SCARA has two rotary joints controlling the horizontal pitch and one prismatic joint for vertical movement, and one more rotary joint at the wrist.

Following is the DH-parameter table for SCARA:

| i | $\alpha_{i-1}$ | $a_{i-1}$ | $d_i$ | $\theta_i$ |
| --- | --- | --- | --- | --- |
| 1 | 0 | L1 | $d_1$ | $\theta_1$ |
| 2 | 0 | L2 | 0 | $\theta_2$ |
| 3 | 0 | 0 | $d_3$ | 0 |
| 3 | 0 | 0 | $d_4$ | $\theta_4$ |

*[TODO: Add SCARA diagram with coordinate frames]*