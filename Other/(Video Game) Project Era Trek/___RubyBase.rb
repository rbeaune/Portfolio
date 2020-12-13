#===============================================================================
# _____RubyBase
# Edited    July 3 2019
#===============================================================================
# ██████╗ ██████╗      ██╗███████╗ ██████╗████████╗
#██╔═══██╗██╔══██╗     ██║██╔════╝██╔════╝╚══██╔══╝
#██║   ██║██████╔╝     ██║█████╗  ██║        ██║
#██║   ██║██╔══██╗██   ██║██╔══╝  ██║        ██║
#╚██████╔╝██████╔╝╚█████╔╝███████╗╚██████╗   ██║
# ╚═════╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝
class Object

  #-------------------------------------------------------------------------
  # * rand_between
  #-------------------------------------------------------------------------
  def rand_between(min, max)
    min + rand(max - min + 1)
  end

end #Object

#██╗███╗   ██╗████████╗███████╗ ██████╗ ███████╗██████╗
#██║████╗  ██║╚══██╔══╝██╔════╝██╔════╝ ██╔════╝██╔══██╗
#██║██╔██╗ ██║   ██║   █████╗  ██║  ███╗█████╗  ██████╔╝
#██║██║╚██╗██║   ██║   ██╔══╝  ██║   ██║██╔══╝  ██╔══██╗
#██║██║ ╚████║   ██║   ███████╗╚██████╔╝███████╗██║  ██║
#╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
class Integer

  #-------------------------------------------------------------------------
  # * even?
  #-------------------------------------------------------------------------
  def even?
    self % 2 == 0
  end
  #-------------------------------------------------------------------------
  # * odd?
  #-------------------------------------------------------------------------
  def odd?
    !even?
  end

end #Integer
