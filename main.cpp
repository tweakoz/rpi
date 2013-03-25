#include <ork/opq.h>

static const int knumthreads = 2;

int main(int argc, char** argv)
{
	auto gopq1 = new OpMultiQ(knumthreads);
	auto l0grp = gopq1->CreateOpGroup("l0");

    auto l0_op = [&]()
	{
		printf( "from opq\n" );
	};

	l0grp->push(Op(l0_op,"yo"));

	gopq1->drain();

	return 0;
}
