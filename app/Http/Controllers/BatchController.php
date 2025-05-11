<?php

namespace App\Http\Controllers;

use App\Models\Batch;
use App\Traits\AdminTrait;
use App\Traits\InstitutionTrait;
use App\Traits\SuperAdminTrait;
use App\Traits\UserTrait;
use Illuminate\Http\Request;

class BatchController extends Controller
{
    use InstitutionTrait, AdminTrait, SuperAdminTrait, UserTrait;
    // set permission
    public function __construct()
    {
        $this->middleware('permission:batch-index')->only(['index', 'show']);
        $this->middleware('permission:batch-create')->only(['create', 'store']);
        $this->middleware('permission:batch-update')->only(['edit', 'update']);
        $this->middleware('permission:batch-destroy')->only('destroy');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if($this->admin()){
            $batches = Batch::with('institution')
                ->withCount(['students' => function ($query) {
                    $query->where('institution_id', $this->institution()->id);
                }])
                ->where('institution_id', $this->institution()->id)->orderBy('id', 'desc')->get();
        } elseif($this->super_admin()) {
            $batches = Batch::with('institution')->withCount('students')->orderBy('id','desc')->get();
        }
        return view('pages.batch.index', compact('batches'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // check authorized action
        $this->authorize('create', Batch::class);
        return view('pages.batch.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'batch_name' => 'required|string',
            'batch_type' => 'required|numeric',
            'batch_year' => 'required|numeric',
            'batch_class' => 'nullable|string',
            'batch_note' => 'nullable|string',
            'batch_fee' => 'required|numeric',
            'batch_start' => 'required',
        ]);
        // check authorized action
        $this->authorize('create', Batch::class);
        $data = $request->all();
        $data['institution_id'] = $this->institution()->id;
        Batch::create($data);
        return redirect()->route('batch.index')->with('created', 'Batch create successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $batch = Batch::with(['students'])->find($id);
        return view('pages.batch.view', compact('batch'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $batch = Batch::find($id);
        // check authorization
        $this->authorize('view', $batch);
        return view('pages.batch.edit', compact('batch'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'batch_name' => 'required|string',
            'batch_type' => 'required|numeric',
            'batch_year' => 'required|numeric',
            'batch_class' => 'nullable|string',
            'batch_note' => 'nullable|string',
        ]);

        $data = $request->all();
        if($request->has('is_active') && $request->is_active == 1) {
            $data['is_active'] = true;
        }else {
            $data['is_active'] = false;
        }
        // check authorized action
        $this->authorize('update', Batch::find($id));

        Batch::find($id)->update($data);
        return redirect()->route('batch.index')->with('updated', 'Batch update successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $batch = Batch::find($id);
        $batch->delete();
        return redirect()->route('batch.index')->with('deleted', 'Batch delete successfull!');
    }
}
