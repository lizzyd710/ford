module external_module
  implicit none

  type basis
    integer :: id
  end type basis

  type, extends(basis) :: test
    logical :: ok
  end type


  type, abstract, public :: solverAborts_type
  contains
    procedure(load_aborts), deferred :: load
  end type solverAborts_type


  abstract interface

    !> Loading additional parameters for solver specific abort criteria.
    subroutine load_aborts(me, handle)
      import solverAborts_type

      !> The solver specific type to hold additional abort parameters.
      class(solverAborts_type), intent(inout) :: me

      !> Handle to configuration to load parameters from.
      integer, intent(in) :: conf

    end subroutine load_aborts

  end interface

contains
  subroutine external_sub
  end subroutine external_sub
end module external_module
