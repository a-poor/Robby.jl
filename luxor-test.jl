
using Pkg
Pkg.activate(".")
# Pkg.add(
#     ["Luxor"],
#     io=devnull
# )

using Luxor
using Colors
# using Robby

# @svg begin
#     N = 10
#     WIDTH = 600
#     STEP = WIDTH / N
#     START = -300
#     for i = 1:(N-1)
#         j = START + STEP * i
#         rule(Point(j,j))
#         rule(Point(j,j),π/2)
#     end
# end


demo = Movie(400,400,"test")

backdrop(s,f) = background("black")

function frame(scene,framenumber)
    sethue(Colors.HSV(framenumber,1,1))
    eased_n = scene.easingfunction(
        framenumber,
        0, 1,
        scene.framerange.stop
    )
    circle(polar(100,-π/2 - (eased_n * 2π)),80,:fill)
end

animate(
    demo,
    [
        Scene(demo,backdrop,0:359),
        Scene(demo,frame,0:359,
            easingfunction=easeinoutcubic,
            optarg="made with Julia"
        )
    ],
    creategif=true
)


